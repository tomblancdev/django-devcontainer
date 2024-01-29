# Issues 😵‍💫

## Table of contents

- [Troubles with git 🌿](#troubles-with-git-)
  - [Git connection with HTTPS to your devcontainer](#git-connection-with-https-to-your-devcontainer)
- [Troubles with Vscode extensions 🧩](#troubles-with-vscode-extensions-)

## Troubles with git 🌿

VsCode share the git configuration with the container so you may be able to use git in the container.

Maybe they are some conditions to use it :
- You may pull the repository from the local machine and not from the container so it can share the git configuration.
- You may use HTTPS and not SSH to pull the repository. (Make it easier)

#### Git connection with HTTPS to your devcontainer

1. Connect on your local machine through HTTPS using [Git CLI](https://github.com/cli/cli#installation)
    ```bash
    gh auth login
    ```
    _[More information into vscode DOC](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git)_

2. Clone the repository
    ```bash
    # ./your-repository-folder
    git clone https://github.com/tomblancdev/devcontainer-python.git
    ```
3. Open the repository in VS Code
4. Open the dev container `> Remote-Containers: Build and Reopen in Container`

5. You can now use git in the container
    ```bash
    # ./your-repository-folder
    git status
    ```

**[See VsCode documentation about sharing your git credentials](https://code.visualstudio.com/remote/advancedcontainers/sharing-git-credentials)**

## Troubles with Vscode extensions 🧩

### Extensions does not load

It appears that sometimes, when you open the devcontainer for the first time, the extensions does not load.

To fix it, simply open the command palette and select `Developer: Reload Window`

It will reload the window with installed extensions.
