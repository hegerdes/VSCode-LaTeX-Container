# VS code LaTeX template project

These repo is meant to be used with vscode to provide an quick and funktional full fleece LeTeX Environment. Images are [here.](https://hub.docker.com/r/hegerdes/vscode-latex)

## Functions
With this image you can:
 * Quickly setup a clean, working LaTeX environment (TexLive)
 * Use pandoc to convert your projects(not in images with the slim attribute)
 * Use any host OS
 * Have our environment on a remote computer
 * Have a setup that is faster than MiKTeX on Windows
 * Have LaTeX Workshop an LaTex Utilities preinstalled (VSCode only)
 * Markdown support (VSCode only)
 * Persistent bash_history (VSCode only)
 * Git support
 * Customize your image with own users or more tools
 * Scientific project template (VSCode only)
## Getting started
### In a container
The entire project is within the container
```bash
# In VSCode hit F1
> Remote-Containers: Clone Repository in Container Volume
> https://github.com/hegerdes/VSCode-LaTeX-Container
# Wait for the initial pull and build
# Note: You need to have docker and vscode remote extentions installed
```
### Local setup
The TeX source is on your host OS and gets mounted as volume
```bash
git clone https://github.com/hegerdes/VSCode-LaTeX-Container
code VSCode-LaTeX-Container
# In VSCode hit F1
> Remote-Containers: Reopen in Container
# Wait for the initial pull and build
# Note: You need to have docker and vscode remote extentions installed
```
## About the image and tags
There are four base images **debian-[buster|stretch], ubuntu-[focal|bionic]**. All these images have **texlive, texlive-latex-extra texlive-lang-english, texlive-luatex, texlive-xetex, texlive-pstricks, texlive-science, latexmk, cm-super, chktex** with additional tools like **git, zsh, python3 and pandoc** installed.

The slim images only contain **texlive, texlive-latex-extra, texlive-lang-english, latexmk, cm-super, chktex**

There are two full images that contain **everything** in the LaTeX world except for docs. Thes are BIG and generally not recommended.

There are a bunch of language specific images that are build up on the **buster-base** and **focal-base** images. Languages are: **all, arabic, chinese, cjk, cyrillic, czechslovak, english, european, french, german, greek, italian, japanese, korean, other, polish, portuguese, spanish**.

Use one of these if your work on a non English project! Simply change the `VARIANT` arg in the devcontainer.json to `buster-lang-<YOUR_LANGUAGE>`.

## The LaTeX template
The template was build up over the time and is designed for satisfice projects. But I didn't start form scratch either. Credit goes to:
```LaTeX
% Original author:
% WikiBooks (LaTeX - Title Creation) with modifications by:
% Vel (vel@latextemplates.com)
% hegerdes (hegerdes@uni-osnabrueck.de)
```

## VSCode workspace
I added a vscode workspace file with *sensible* setting. Customize it after your own taste.

## Why
I always liked the concept of LaTeX and its focus on content instead of the formatting. But getting started was hard. I first used MiKTeX and TeXworks, but I found the usage of shortcuts hard and didn't like the PDF viewer. I switched t Notepad++, SumataPDF and a handy script. It was great till my projects got bigger. So I used VSCode and LaTeX Workshop and I loved it. All my shortcuts and tools I used before now applied to LaTeX. I was satisfied until I realized how slow MiKTeX on windows is compared to Linux.

I love Linux but some things are more convenient on Windows. I started my Bachelor theses about development environments and the usage of container tools. So I have further developed my setup to bring everything together.

I found that the `tianon/latex` and other image were outdated and did not meet my expectations. I rather created my own image. It is own the large side but I rather have all my tools there at any time instead of being slowed down by missing them or have to install packages manually. I hope some of you find some interesting tips and tricks in my setup.


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
