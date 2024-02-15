FROM mcr.microsoft.com/devcontainers/base:debian as builder
# FROM mcr.microsoft.com/devcontainers/base:jammy

ARG DEBIAN_FRONTEND=noninteractive
ARG USER=vscode

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y build-essential --no-install-recommends make \
        ca-certificates \
        git \
        libssl-dev \
        zlib1g-dev \
        libbz2-dev \
        libreadline-dev \
        libsqlite3-dev \
        wget \
        curl \
        llvm \
        libncurses5-dev \
        xz-utils \
        tk-dev \
        libxml2-dev \
        libxmlsec1-dev \
        libffi-dev \
        liblzma-dev \
        nginx

# Python and poetry installation
USER $USER
ARG HOME="/home/$USER"
ARG PYTHON_VERSION=3.12
# ARG PYTHON_VERSION=3.10

ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${HOME}/.local/bin:$PATH"

RUN echo "done 0" \
    && curl https://pyenv.run | bash \
    && echo "done 1" \
    && pyenv install ${PYTHON_VERSION} \
    && echo "done 2" \
    && pyenv global ${PYTHON_VERSION} \
    && echo "done 3" \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && poetry config virtualenvs.in-project true

FROM builder as development
ENV APP_HOME="/workspace"
CMD /bin/sh -c "while sleep 1000; do :; done"

FROM builder as production
ENV APP_HOME="/app"
RUN echo "Copying nginx.conf to /etc/nginx/nginx.conf"
COPY ./.devcontainer/nginx/nginx.conf ${APP_HOME}/.devcontainer/nginx/nginx.conf
RUN echo "Copying files to ${APP_HOME}"
COPY . ${APP_HOME}
RUN echo "Copying .devcontainer/scripts to ${APP_HOME}/.devcontainer/scripts"
COPY ./.devcontainer/scripts ${APP_HOME}/.devcontainer/scripts
WORKDIR ${APP_HOME}
RUN echo "Installing dependencies"
RUN poetry install --only main
CMD bash ${APP_HOME}/.devcontainer/scripts/run-production.sh
