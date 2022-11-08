r"""
mpv-lua.rst 的文本特征：
* 模块开始的标志：
    ```
    ^[^ ]+
    ------

    ```
* api 开始的标志：
    ```
    ^``[^`]+``$
    ```
* api 说明文本开始的标志：
   ```
   ^[ ]{4}\w+
   ```
* 特殊设定：
    * "mp.options functions" 模块的 "example" 缩进不对，需要手动删掉
    * 需要增加 "End\n---\n" 到文档结尾
"""

import itertools
import logging
from functools import partial
from io import BufferedWriter
from pathlib import Path
from typing import Callable, Iterator

import attrs


class Facts:
    root = Path(__file__).parent.parent
    source_file = root.joinpath("gens", "mpv-lua.rst")
    output_file = root.joinpath("mpv", "library", "mpv.lua")


def SourceIterator() -> Iterator[bytes]:
    with open(Facts.source_file, "rb") as fp:
        for line in fp:
            yield line[:-1]


def check_and_pass_module_start_lines(line: bytes, sentinel: bytes, iter: Iterator[bytes]):
    if line != sentinel:
        return False

    assert next(iter) == ("-" * len(line)).encode()
    assert next(iter) == b""
    return True


@attrs.define
class GeneralProcedureHooks:
    TextHandler = Callable[[bytes], None]

    mod_docs: TextHandler
    mod_end: Callable[[], None]
    api_docs: TextHandler
    api_end: Callable[[bytes], None]


def general_procedure(iter: Iterator[bytes], sentinel: bytes, hooks: GeneralProcedureHooks):
    def collect_module_docs():
        last_line = None
        for line in itertools.chain(iter):
            if line.startswith(b"``"):
                last_line = line
                break
            if line == b"":
                continue
            hooks.mod_docs(line)

        assert last_line is not None, "unreachable: module has no api"
        hooks.mod_end()
        return last_line

    def collect_api_docs(first_line):
        api_sign_line = None
        for line in itertools.chain((first_line,), iter):
            if check_and_pass_module_start_lines(line, sentinel, iter):
                break

            if line.startswith(b"``"):
                if api_sign_line is None:
                    api_sign_line = line
                else:
                    hooks.api_end(api_sign_line)
                    api_sign_line = line
                continue

            if line.startswith(b"    "):
                hooks.api_docs(line)
                continue
            if line == b"":
                continue

            logging.debug("malformed line: %s", line)
            raise RuntimeError("unreachable: invalid indent level")

        assert api_sign_line is not None, "unreachable: sentinel has not be seen"
        hooks.api_end(api_sign_line)
        api_sign_line = None

    collect_api_docs(collect_module_docs())


def sink_procedure(iter: Iterator[bytes], sentinel: bytes):
    for line in iter:
        if check_and_pass_module_start_lines(line, sentinel, iter):
            return
    raise RuntimeError("unreachable: sentinel has not be seen")


def make_proc_stack(output_fp: BufferedWriter):
    stack = []

    bracket_trans = bytes.maketrans(b"[]", b"  ")

    def _mp_functions(mod: bytes | None = None, api_prefix: bytes | None = None):

        if api_prefix is None:
            api_decl_prefix = b"function "
        else:
            api_decl_prefix = b"function " + api_prefix

        mod_decl = None
        if mod is not None:
            mod_decl = b"".join([b"--@class ", mod, b"\n", mod, b" = {}", b"\n\n"])

        def _mod_docs(text: bytes):
            if mod is None:
                return
            output_fp.write(b"--")
            output_fp.write(text)
            output_fp.write(b"\n")

        def _mod_end():
            if mod_decl is None:
                return
            output_fp.write(mod_decl)

        def _api_docs(text: bytes):
            output_fp.write(b"--")
            output_fp.write(text[4:])
            output_fp.write(b"\n")

        def _api_end(text: bytes):
            """
            special case: ``msg.fatal(...)``, ``msg.error(...)``, ``msg.warn(...)``, ``msg.info(...)``, ``msg.verbose(...)``, ``msg.debug(...)``, ``msg.trace(...)``
            """

            # split by "``, ``"
            if b"``, ``" in text:
                signs = text[2:-2].split(b"``, ``")
            else:
                signs = [text[2:-2]]

            parts = []

            for sign in signs:
                parts.append(api_decl_prefix)
                # "[]" -> " "
                if b"[" in sign:
                    sign = sign.translate(bracket_trans)
                # "|" -> "_or_"
                if b"|" in sign:
                    sign = sign.replace(b"|", b"_or_")
                parts.extend((sign, b" end", b"\n"))

            parts.append(b"\n")
            output_fp.write(b"".join(parts))

        return partial(general_procedure, hooks=GeneralProcedureHooks(_mod_docs, _mod_end, _api_docs, _api_end))

    stack.append((b"mp functions", _mp_functions(b"mp")))
    stack.append((b"Advanced mp functions", _mp_functions(None)))
    stack.append((b"mp.msg functions", _mp_functions(b"mp.msg", b"mp.")))
    stack.append((b"mp.options functions", _mp_functions(b"mp.options", b"mp.")))
    stack.append((b"mp.utils functions", _mp_functions(b"mp.utils", b"mp.")))
    stack.append((b"Events", sink_procedure))
    stack.append((b"Extras", _mp_functions(b"Extras")))
    stack.append((b"End", None))

    return stack


def main():
    with open(Facts.output_file, "wb") as fp:
        stack = make_proc_stack(fp)
        iter = SourceIterator()

        # fastforward
        first_indicator = stack[0][0]
        for line in iter:
            if check_and_pass_module_start_lines(line, first_indicator, iter):
                break
        else:
            raise RuntimeError("unreachable: first proc never gets chance to run")

        while stack:
            _, proc = stack.pop(0)
            if proc is None:
                break
            sentinel = stack[0][0]
            proc(iter, sentinel)


if __name__ == "__main__":
    logging.basicConfig(level="DEBUG", style="{", datefmt="%Y-%m-%d %H:%M:%S", format="{asctime} {message}")
    main()
