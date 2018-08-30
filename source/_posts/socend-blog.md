---
title: linux 服务器 centos7 防火墙端口设置
date: 2018-08-10 16:48:28
tags: #文章标签 可以省略
     - centos7
     - linux
categories: #文章分类 可以省略
     - centos7 
---

# 添加防火墙端口
先说说 centos7 与 centos6 防火墙区别
# centos7 用的是 firewall
  - 操作防火墙命令：
      * 停止firewall
      ```
      systemctl stop firewalld.service
      ```
      * 启动firewall
      ```
      systemctl start firewalld.service
      ```
      * 查看默认防火墙状态（不运行显示notrunning，运行显示running）
      ```
      firewall-cmd --state 
      ```
      * 查看已经开放的端口
      ```
      firewall-cmd --list-ports 
      ```
      * 重启一个服务：
      ```
      systemctl restart firewalld.service
      ```
      * 添加一个端口（--permanent永久生效，没有此参数重启后失效）
      ```
      firewall-cmd --zone=public --add-port=80/tcp --permanent
      firewall-cmd --zone=public --add-port=443/tcp --permanent
      firewall-cmd --zone=public --add-port=22/tcp --permanent
      ```
# centos6 用的是 iptable
  - 操作防火墙命令：
      * 查看防火墙的状态
      ```
      service iptable status
      ```
      * 临时关闭防火墙
      ```
      servcie iptables stop  
      ```
      * --永久关闭防火墙
      ```
      chkconfig iptables off 
      ```

      * --永久关闭防火墙
      ```
      chkconfig iptables off 
      ```
      * 如要开放80，22，8080 端口，输入以下命令即可
      ```
        iptables -I INPUT -p tcp --dport 80 -j ACCEPT

        iptables -I INPUT -p tcp --dport 22 -j ACCEPT

        iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
      ```
