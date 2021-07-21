# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version: buster, bullseye, bionic, focal
ARG VARIANT="buster"
FROM hegerdes/vscode-latex:${VARIANT}

ARG USERNAME=latex
ARG USER_UID=1001
ARG USER_GID=1000

RUN if [ ${USERNAME} != "latex" ] && [ ${USERNAME} != "root" ]; \
    then useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL >> /etc/sudoers.d/$USERNAME \
    else echo "No new user created"; fi

RUN if [ ${USERNAME} != "latex" ] && [ ${USERNAME} != "root" ]; \
    then mkdir -p /home/${USERNAME}/.vscode-server/extensions \
    && mkdir -p /root/.vscode-server/extensions \
    && chown -R ${USERNAME} /home/${USERNAME}/.vscode-server; fi

RUN if [ ${USERNAME} != "latex" ] && [ ${USERNAME} != "root" ]; \
    then SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir -p /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory \
    && echo $SNIPPET >> "/home/${USERNAME}/.bashrc" \
    && echo $SNIPPET >> "/root/.bashrc"; fi

RUN chsh --shell /bin/zsh ${USERNAME}
