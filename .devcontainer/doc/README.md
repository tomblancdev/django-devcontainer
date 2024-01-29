# Python devcontainer template
___
## Description 📃

This dev container is designed to be used with the [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension for VS Code. This extension allows you to open any folder in a container, on a remote machine, or in WSL and take advantage of VS Code's full feature set.

## Table of contents 📑

- [Python devcontainer template](#python-devcontainer-template)
  - [Description](#description)
  - [Table of contents](#table-of-contents)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Steps](#steps)
  - [Setting up the dev container](#setting-up-the-dev-container-)
    - [Rename the service](#rename-the-service-)
    - [Rename the container](#rename-the-container)
    - [Rename the devcontainer](#rename-the-devcontainer)
  - [Add it to your production docker-compose](#add-it-to-your-production-docker-compose)
  - [Provided tools](#provided-tools)
  - [Issues](#issues)

## Getting started

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [VS Code](https://code.visualstudio.com/)
- [Remote - Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension
- [Docker extension](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)

### Steps

1. Create a new repository using this template
2. Clone the repository
3. Open the repository in VS Code
4. Click the green "Open a Remote Window" button in the bottom left corner of the window
5. Select "Remote-Containers: Open Folder in Container..."
6. Select the repository folder
7. Wait for the container to build
8. You're done! You can now use VS Code as normal

## Setting up the dev container

### Rename the service

This service is named `python-devcontainer` by default.

If you want to change the name of the service, you need to change the name in many files:
- [.devcontainer/devcontainer.json](../devcontainer.json)
- [.devcontainer/docker-compose.dev.yml](../docker-compose.dev.yml)

### Rename the container

This container is named `python-devcontainer` by default.

Name of the container is defined in the [docker-compose.dev.yml](../docker-compose.dev.yml) file.

### Rename the devcontainer

This devcontainer is named `python-devcontainer` by default.

Name of the devcontainer is defined in the [devcontainer.json](../devcontainer.json) file.

## Add it to your production docker-compose

By default this devcontainer is not included in the production docker-compose file.

But it provide the extending one for development that can be used as standalone and override the production one for development purpose in dev container.

```json
"dockerComposeFile": [
        // "../../docker-compose.yml", // ! 👈 Uncomment or change this to the path of your docker-compose file.
        "./docker-compose.dev.yml" // 👈 this is the development file.
    ],
```

If you want to include it, you need to add it to the [docker-compose.yml](../docker-compose.yml) file.

```json
"dockerComposeFile": [
        "../../docker-compose.yml", // 👈 Here is done.
        "./docker-compose.dev.yml"
    ],
```

### Add your git template base

If you want to add your own git template base, you need to add it to the [devcontainer.json](../devcontainer.json) file.

```json
"containerEnv": {
  "GIT_TEMPLATE_REPO_URL": "https://github.com/tomblancdev/python-devcontainer.git", // ! 👈 Change this to your template repository.
  "GIT_TEMPLATE_REMOTE_NAME": "template" // ! 👈 Change this to your template remote.
},
```

The template will be set at the first build of the devcontainer.

When container start, it will check if your current repository is up to date with the template repository.

## Provided tools

> Please refer to [provided tools DOC](./provided-tools.md) for more information

## Issues

> Please refer to [issues DOC](./issues.md) for more information
