#!/usr/bin/python3

"""
Git hook to generate commit messages using AI.

- copy the content of this file to `.git/hooks/prepare-commit-msg`
- ensure the file is executable by running `chmod +x .git/hooks/prepare-commit-msg`

Dependencies: openai
"""

import os
import pathlib
import subprocess
import sys

import openai

API_KEY = os.getenv("OPENAI_API_KEY")
BASE_URL = "https://api.deepseek.com"

# https://api-docs.deepseek.com/quick_start/pricing
MODELS = frozenset({"deepseek-reasoner", "deepseek-chat"})
DEFAULT_MODEL = "deepseek-reasoner"


def get_repo_root() -> str:
    """
    Get the root directory of the git repository.
    """
    result = subprocess.run(
        ["git", "rev-parse", "--show-toplevel"],
        capture_output=True,
        check=True,
        text=True,
    )
    return result.stdout.strip()


def generate_commit_message() -> str:
    """
    Generate a commit message using AI.
    """
    root = get_repo_root()
    diff = subprocess.run(
        ["git", "diff", "--staged"],
        cwd=root,
        capture_output=True,
        check=True,
        text=True,
    )

    prompt = f"""
    Please follow these guidelines and provide a commit message:
    - Use only the imperative mood
    - Title must have a maximum of 50 characters
    - Separate the title from the body with a blank line
    - Each line in the body must have a maximum of 72 characters
    - Explain why changes were made, not just what changed
    - Use only paragraphs in the body
    - Return the output without markdown formatting

    === DIFF ===

    {diff.stdout}
    """

    # TODO: change this to ollama
    client = openai.OpenAI(api_key=API_KEY, base_url=BASE_URL)

    response = client.chat.completions.create(
        model=DEFAULT_MODEL,
        messages=[
            {"role": "system", "content": "You are a senior principal software engineer"},
            {"role": "user", "content": prompt},
        ],
        stream=False,
    )

    msg = response.choices[0].message.content
    if msg is None:
        raise RuntimeError("Artificial intelligence took a break")

    return msg


def main() -> None:
    """
    Main function.
    """
    commit_editmsg = pathlib.Path(sys.argv[1])
    commentary = commit_editmsg.read_text()

    # if the commit message is not empty, do not generate a new one
    if commentary.splitlines()[0] != "":
        return

    ai_content = generate_commit_message()
    commit_editmsg.write_text(ai_content + commentary)


if __name__ == "__main__":
    main()
