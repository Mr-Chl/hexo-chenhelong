---
title: git_completion
date: 2019-04-10 13:23:42
tags:
categories:
---

# macOs 添加 git 自动补全

* 检查是否安装brew 
    ```
        brew list
    ```
* 如果没有安装则首先安装brew 
    ```
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    ```

* 安装brew 完毕后 接着安装bash-completion

    ```
        brew install bash-completion
    ```

* 安装完 bash-completion 查看 bash-completion安装信息
    ```
        brew info bash-completion
    ```
* 会提示输出以下信息

    ```
        bash-completion: stable 1.3 (bottled)
        Programmable completion for Bash 3.2
        https://salsa.debian.org/debian/bash-completion
        Conflicts with:
        bash-completion@2 (because Differing version of same formula)
        /usr/local/Cellar/bash-completion/1.3_3 (189 files, 607.8KB) *
        Poured from bottle on 2019-04-10 at 12:00:17
        From: https://github.com/Homebrew/homebrew-core/blob/master/Formula/bash-completion.rb
        ==> Caveats
        Add the following line to your ~/.bash_profile:
        [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

        Bash completion has been installed to:
        /usr/local/etc/bash_completion.d
        ==> Analytics
        install: 15,963 (30 days), 49,500 (90 days), 192,396 (365 days)
        install_on_request: 14,681 (30 days), 45,544 (90 days), 175,354 (365 days)
        build_error: 0 (30 days)

    ```

* vi ~/.bash_profile 如果没有该文件，新建一个   添加以下内容

    ```
        [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

        f [ -f ~/.git-completion.bash ]; then
        . ~/.git-completion.bash
        fi
    ```
* 接着找到 git-completion.bash 复制到 ~/ 目录，我的Git是安装在 /usr/local/git/contrib/completion/git-completion.bash

    ```
        cp /usr/local/git/contrib/completion/git-completion.bash ~/.git-completion.bash

    ```
* 创建 vi ~/.bashrc文件(如果没有新建一个) 添加以下内容

    ```
        source ~/.git-completion.bash
    ```

* 终端输入 source ~/.git-completion.bash 完活！