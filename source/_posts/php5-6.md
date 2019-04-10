---
title: php5.6
date: 2019-04-10 13:47:40
tags: 
    - php 
    - php 5.6
    - php 安装
categories:
---

# macOS 10.14.* Mojave 安装php5.6 版本

Macos 升级10.14 系统之后，如果想安装php5.6版本的时候，无法用brew install php5.6安装，因为在新的brew中已经废弃了php5.6和php7.0，如果使用brew search php搜索出来的Php版本最低是php@7.1的，因为公司项目是php5.6 版本的 搜索一番后 找到方法特此记录以下。

**默认安装的brew 源已经把php5.6 && php7.0 已经下架 所以需要跟换源**

    ```
        brew tap exolnet/homebrew-deprecated
    ```
**搜索php 会出现 php@5.6的版本**

    ```
        brew search php
    ```
**安装php5.6** 

    ```
        brew install php@5.6
    ```

**剩下的启动 还有安装自己项目需要说的 插件**


