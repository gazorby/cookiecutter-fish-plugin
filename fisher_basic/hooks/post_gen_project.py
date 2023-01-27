import shutil
from enum import Enum
from pathlib import Path


class CITool(Enum):
    GITHUB = "github"


ci_tool: bool = "{{ cookiecutter.ci_tool }}"
use_precommit: bool = "{{ cookiecutter.use_precommit }}" == "y"


def remove_ci_tool_github() -> None:
    """Remove GitHub CI files."""
    shutil.rmtree(".github")


def remove_pre_commit() -> None:
    Path(".pre-commit-config.yaml").unlink()


def main():
    if ci_tool != CITool.GITHUB.value:
        remove_ci_tool_github()
    if not use_precommit:
        remove_pre_commit()


if __name__ == "__main__":
    main()
