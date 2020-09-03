---
title: jenkins
date: 2020-05-15 11:00:46
tags: jenkins java
categories: jenkins
---

## 安装jenkins

* 安装java
  > yum install java -y

  #### 查看是否安装成功
  ```
  java -version
  ```
  #### 提示以下内容 标识已经安装成功
  ```
  openjdk version "1.8.0_262"
  OpenJDK Runtime Environment (build 1.8.0_262-b10)
  OpenJDK 64-Bit Server VM (build 25.262-b10, mixed mode)
  ```
* 安装 jenkins
```
wget https://pkg.jenkins.io/redhat/jenkins-2.156-1.1.noarch.rpm
rpm -ivh jenkins-2.222.3-1.1.noarch.rpm
```
* 配置 jenkins 
```
vim /etc/sysconfig/jenkins
# 修改 监听端口
JENKINS_PORT="8080"
#修改执行权限 (为了不因为权限出现各种问题，这里直接使用root)
$JENKINS_USER="root"
```
* 修改jenkins 文件权限
```
chown -R root:root /var/lib/jenkins
chown -R root:root /var/cache/jenkins
chown -R root:root /var/log/jenkins
```

* 启动jenkins
```
systemctl start jenkins
```

## 卸载jenkins

```

service jenkins stop
 
yum -y remove jenkins


1、rpm卸载
rpm -e jenkins
 
2、检查是否卸载成功
rpm -ql jenkins 
 
3、彻底删除残留文件：

find / -iname jenkins | xargs -n 1000 rm -rf
```