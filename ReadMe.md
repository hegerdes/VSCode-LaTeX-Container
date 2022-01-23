# VS code LaTeX template project

This repo is meant to be used with VSCode to provide a quick and functional full fleece LeTeX Environment. Images are available [here.](https://hub.docker.com/r/hegerdes/vscode-latex)

## Functions
With this image you can:
 * A quick, clean, working LaTeX environment setup based on TeXLive
 * Pandoc - To convert your projects between different formats
 * Use any host OS
 * Support for x86/arm/arm64 architectures
 * Have our environment on a remote computer
 * Have a setup that is faster than MiKTeX on Windows
 * Have LaTeX Workshop an LaTex Utilities preinstalled (VSCode only)
 * Markdown support (VSCode only)
 * Spell checking (VSCode only)
 * Persistent bash_history (VSCode only)
 * Git support
 * Customize your image with own users or more tools
 * Scientific project template (VSCode only)


## Getting started
### Local setup 
The TeX source is on your host OS and gets mounted as volume
```bash
# Open a terminal an type:
git clone https://github.com/hegerdes/VSCode-LaTeX-Container
code VSCode-LaTeX-Container
# In VSCode hit F1
> Remote-Containers: Reopen in Container
# Wait for the initial pull and build
# Note: You need to have Docker and VSCode remote extentions installed
# Search for "ms-vscode-remote.vscode-remote-extensionpack"
```

### In a container
The entire project is within the container
```bash
# Open VSCode
# In VSCode hit F1
> Remote-Containers: Clone Repository in Container Volume
> https://github.com/hegerdes/VSCode-LaTeX-Container
# Wait for the initial pull and build
# Note: You need to have Docker and VSCode remote extentions installed
# Search for "ms-vscode-remote.vscode-remote-extensionpack"
```

## About the Docker image
There are multiple base images **debian-[bullseye|buster (deprecated)] and ubuntu-[focal|bionic (deprecated)]**. All these images have **texlive, texlive-latex-extra texlive-lang-english, texlive-luatex, texlive-xetex, texlive-pstricks, texlive-science, latexmk, cm-super, chktex** with additional tools like **git, zsh and pandoc(not in alpine)** installed. Every image is available on x86/arm/arm64 architectures.

The slim images only contain **texlive, texlive-latex-extra, texlive-lang-english, latexmk, cm-super, chktex**
If you want a minimal image use these, but this might lack common tools/packages.

There are two full images that contain **everything** in the LaTeX world except for docs. These are **BIG** and generally not recommended for fast startups.

There are a bunch of language specific images that are build up on the **bullseye-base** and **focal-base** images. Languages are: **all, arabic, chinese, cjk, cyrillic, czechslovak, english, european, french, german, greek, italian, japanese, korean, other, polish, portuguese, spanish**.

Use one of these if your work on a none English project! Simply change the `VARIANT` arg in the devcontainer.json to `bullseye-lang-<YOUR_LANGUAGE>` or `ubuntu-lang-<YOUR_LANGUAGE>`.

I plan on updating these images every second month.

### The LaTeX template
The included template was build up over the time and is designed for scientific projects. But I didn't start from scratch either. Credit goes to:
```LaTeX
% Original author:
% WikiBooks (LaTeX - Title Creation) with modifications by:
% Vel (vel@latextemplates.com)
% hegerdes (hegerdes@outlook.de)
```

### VSCode workspace
I added a VSCode workspace file with *sensible* setting. It includes some settings for Docker and the LaTeX extensions. Feel free to customize it after your own taste.

## Why all this
I always liked the concept of LaTeX and its focus on content instead of the formatting. But getting started was hard and I wanted to contribute to make it a little more accessible. I first used MiKTeX and TeXworks, but I found the usage of shortcuts hard and didn't like the PDF viewer. I switched to Notepad++, SumataPDF (both great tools) and a handy script. It was great until my projects got bigger. So I used VSCode and LaTeX Workshop and I loved it. All my shortcuts and tools I used before now applied to LaTeX. I was satisfied until I realized how slow MiKTeX on Windows is compared to Linux.

I love Linux, but some things are more convenient on Windows. I started my Bachelor theses about development environments and the usage of container tools. So I have further developed my setup to bring everything together.

I found that the `tianon/latex` and other image were outdated and did not meet my expectations. I rather created my own image. It is own the large side, but I rather have all my tools there at any time instead of being slowed down by missing them or have to install packages manually. I hope some of you find some interesting tips and tricks in my setup.


If you find any issues let me [know](https://github.com/hegerdes/VSCode-LaTeX-Container/issues)

## Tips & Tricks
 * If you use git. Checkout everything with `lf` line endings
```text
* text=auto eol=lf
*.{cmd,[cC][mM][dD]} text eol=crlf
*.{bat,[bB][aA][tT]} text eol=crlf
```
 * On Windows use the WSL2 backend
 * You can customize your environment by changing the image in the .devcontainer folder
 * You can add own users by changing the `USERNAME` and `remoteUser` in the devcontainer.json
 * Check out the template with:
```bash
# In VSCode hit F1
> Remote-Containers: Clone Repository in Container Volume
> https://github.com/hegerdes/VSCode-LaTeX-Container
```

### Support me
If you like this or other projects may consider [supporting me.](https://paypal.me/hegerdes?locale.x=de_DE)
