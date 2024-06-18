#!/usr/bin/env python3

import shutil
from pathlib import Path


class facts:
    root = Path(__file__).parent
    upstream = Path("/srv/playground/neovim")


def copy_meta_files():
    dest = facts.root.joinpath("library/upstream")

    shutil.rmtree(dest)
    dest.mkdir()

    for file in facts.upstream.joinpath("runtime/lua/vim/_meta").iterdir():
        shutil.copy(file, dest)


def copy_runtime_files():
    dest = facts.root.joinpath("vim")

    shutil.rmtree(dest)
    dest.mkdir()

    shutil.copytree(facts.upstream.joinpath("runtime/lua/vim/lsp"), dest.joinpath("lsp"))
    shutil.copy(facts.upstream.joinpath("runtime/lua/vim/lsp.lua"), dest)


def main():
    copy_meta_files()
    copy_runtime_files()


if __name__ == "__main__":
    main()
