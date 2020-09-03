---
title: CentOS 7 安装 NextCloud
date: 2020-05-08 14:55:01
tags:
categories:
---


### CentOS 7 安装 NextCloud

  * 添加 epel 仓库
    ```
      yum -y install epel-release
    ```

  * 添加 Webtatic 仓库
    ```
      rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
    ```
  * 卸载 php相关插件 防止冲突
    ```
    yum -y remove php*
    ```

  * 安装 php
    ```
    yum -y install php72w php72w-cli php72w-fpm php72w-common php72w-devel php72w-embedded php72w-gd php72w-mbstring php72w-mysqlnd php72w-opcache php72w-pdo php72w-xml php72w-process
    ```
  * 查看php 版本
    ```
      php -v
    ```

### 配置 php

  * 配置 php 与 Nginx 运行

    ```
    vi /etc/php-fpm.d/www.conf
    ```
  
  * 修改 user 和 group 为 nginx.
    ```
    ; RPM: apache Choosed to be able to access some dir as httpd
    user = nginx
    ; RPM: Keep a group allowed to write in log dir.
    group = nginx
    ```
  * 指定php 端口
    ```
    ; Note: This value is mandatory.
    listen = 127.0.0.1:9000
    ```
  * 启用 php-fpm 的系统环境变量
    ```
    ; Pass environment variables like LD_LIBRARY_PATH. All $VARIABLEs are taken from
    ; the current environment.
    ; Default Value: clean env
    env[HOSTNAME] = $HOSTNAME
    env[PATH] = /usr/local/bin:/usr/bin:/bin
    env[TMP] = /tmp
    env[TMPDIR] = /tmp
    env[TEMP] = /tmp
    ```

  * 在 /var/lib/ 目录下新建文件夹 session, 拥有者改为 ngnix
    ```
    mkdir -p /var/lib/php/session
    chown nginx:nginx -R /var/lib/php/session/
    ```
    * 如果 提示 chown: 无效的用户: "nginx:nginx"
    ```
      adduser nginx

      在执行 chown nginx:nginx -R /var/lib/php/session/
    ```
  * 启动 php
    ```
    sudo systemctl start php-fpm
    ```

### 安装/配置 MariaDB

  * 安装 MariaDB 
  ```
  sudo yum -y install mariadb mariadb-server
  sudo systemctl start mariadb
  sudo systemctl enable mariadb
  ```
  * 配置 MariaDB
  ```
    mysql_secure_installation
    Set root password? [Y/n] Y
    New password:
    Re-enter new password:
    Remove anonymous users? [Y/n] Y
    Disallow root login remotely? [Y/n] Y
    Remove test database and access to it? [Y/n] Y
    Reload privilege tables now? [Y/n] Y
  ```

  * 添加 nextcloud 的 user 与数据库
  ```
  mysql -u root -p
  Enter password: 
  Welcome to the MariaDB monitor.  Commands end with ; or \g.
  Your MariaDB connection id is 2586
  Server version: 5.5.60-MariaDB MariaDB Server

  Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

  Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

  MariaDB [(none)]> create database nextcloud_db;
  MariaDB [(none)]> create user nextclouduser@localhost identified by 'password!@#';
  MariaDB [(none)]> grant all privileges on nextcloud_db.* to nextclouduser@localhost identified by 'password!@#';
  MariaDB [(none)]> flush privileges;
  MariaDB [(none)]> exit;
  ```
  * 授权第三方登录
  ```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '密码' WITH GRANT OPTION;
  ```

  ### 自签的 SSL 证书

  ```
    mkdir -p /etc/nginx/cert/
    openssl req -new -x509 -days 365 -nodes -out /etc/nginx/cert/nextcloud.crt -keyout /etc/nginx/cert/nextcloud.key
    sudo chmod 700 /etc/nginx/cert
    sudo chmod 600 /etc/nginx/cert/nextcloud.key /etc/nginx/cert/nextcloud.crt
  ```

### 下载 NextCloud

  * 安装 wget 与 unzip
    ```
    yum -y install wget unzip
    ```
  *  下载NextCloud
    ```
    cd /usr/local
    wget https://download.nextcloud.com/server/releases/nextcloud-14.0.4.zip
    wget https://download.nextcloud.com/server/releases/nextcloud-14.0.4.zip.sha256
    $ sha256sum -c nextcloud-14.0.4.zip.sha256 < nextcloud-14.0.4.zip
    ```
  * 解压并将 NextCloud 剪切到 /usr/share/nginx/html/ 目录下
    ```
    unzip nextcloud-10.0.2.zip
    sudo cp -R nextcloud/ /usr/share/nginx/html/
    ```
  * 新建 data 文件夹, 并变更 nextcloud 所有者为 nginx

    ```
    cd /usr/share/nginx/html/
    sudo mkdir -p nextcloud/data/
    chown nginx:nginx -R nextcloud/
    chown nginx:nginx -R data/

    ```

### 配置 NextCloud
  * 在 Nginx 中为 Nextcloud 配置虚拟主机


### nextcloud 报错

关闭或正确地配置SELinux

临时的关闭可以用：

setenforce 0

永久关闭则可以编辑/etc/selinux/config 文件：

vim /etc/selinux/config

找到SELINUX=enforcing，将它改为SELINUX=disabled。

再刷新页面，错误信息就消失了：
