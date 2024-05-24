import shutil
from pathlib import Path

#!/usr/bin/env python3


class facts:
    root = Path(__file__).parent
    upstream = root.joinpath(root, "library/upstream")
    runtime_meta = Path("/srv/playground/neovim/runtime/lua/vim/_meta")


def main():
    shutil.rmtree(facts.upstream)
    facts.upstream.mkdir()

    for file in facts.runtime_meta.iterdir():
        shutil.copy(file, facts.upstream)


if __name__ == "__main__":
    main()
