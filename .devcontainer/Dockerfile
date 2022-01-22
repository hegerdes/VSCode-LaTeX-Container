# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.177.0/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Version: bullseye-[slim|full], focal-[slim|full], alpine
# For bullseye and focal also language specific version exist. Use bullseye-<LANG>, focal-<LANG>
# LANG: [all, arabic, chinese, cjk, cyrillic, czechslovak, english, european, french, german, greek, italian, japanese, korean, other, polish, portuguese, spanish]
ARG VARIANT="bullseye"
FROM hegerdes/vscode-latex:${VARIANT}

ARG USERNAME=latex
ARG USER_UID=1001
ARG USER_GID=1000

RUN if [ ${USERNAME} != "latex" ] && [ ${USERNAME} != "root" ]; \
    then useradd --uid $USER_UID --gid $USER_GID -m $USERNAME -s $(which zsh) \
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
