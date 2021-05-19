# See here for image contents: https://hub.docker.com/r/hegerdes/vscode-latex

# [Choice] buster-base, stretch-base, focal-base, bionic-base
# or buster-lang-YOUR_LANGUAGE focal-lang-YOUR_LANGUAGE
# Languages are: all, arabic, chinese, cjk, cyrillic,
# czechslovak, english, european, french, german, greek, italian,
# japanese, korean, other, polish, portuguese, spanish

# For more see https://hub.docker.com/r/hegerdes/vscode-latex
ARG VARIANT="buster-base"
FROM hegerdes/vscode-latex:${VARIANT}

ARG USERNAME="vscode"
ARG USER_UID=1001
ARG USER_GID=1000

RUN if [ ${USERNAME} != "vscode" ] && [ ${USERNAME} != "root" ]; \
    then useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL >> /etc/sudoers.d/$USERNAME \
    else echo "No new user created"; fi

RUN if [ ${USERNAME} != "vscode" ] && [ ${USERNAME} != "root" ]; \
    then mkdir -p /home/${USERNAME}/.vscode-server/extensions \
    && mkdir -p /root/.vscode-server/extensions \
    && chown -R ${USERNAME} /home/${USERNAME}/.vscode-server; fi

RUN if [ ${USERNAME} != "vscode" ] && [ ${USERNAME} != "root" ]; \
    then SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && mkdir -p /commandhistory \
    && touch /commandhistory/.bash_history \
    && chown -R $USERNAME /commandhistory \
    && echo $SNIPPET >> "/home/${USERNAME}/.bashrc" \
    && echo $SNIPPET >> "/root/.bashrc"; fi

RUN chsh --shell /bin/zsh ${USERNAME}

