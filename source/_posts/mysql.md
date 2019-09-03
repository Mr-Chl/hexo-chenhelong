---
layout: centeros7安装mysql
title: centeros7安装mysql 并设置密码
date: 2019-04-12 16:57:54
tags:
    - center OS7
    - mysql
    - set mysql password
---

### centeros7安装mysql 并设置密码

1. 下载 mysql 源文件(如果没有wget 先下载wget yum install wegt)

```
wget http://repo.mysql.com/mysql57-community-release-el7-10.noarch.rpm
```
2. 解析安转软件源

```
rpm -Uvh mysql57-community-release-el7-10.noarch.rpm
```
3. 安装 mysql 服务

```
yum install  -y  mysql-community-server
```

4. 启动/重启/停止 mysql 服务

> 启动

```
service mysqld start
```
> 重启

```
service mysqld restart
```
> 停止

```
service mysqld stop
```
5.  查看mysql 启动状态

```
service mysqld status
```
以上就是安装mysql 部分
---

### 修改mysql密码

1. Mysql5.7默认安装之后root是有密码的 先获取默认密码

> 为了加强安全性，MySQL5.7为root用户随机生成了一个密码，在error log中，关于error log的位置，如果安装的是RPM包，则默认是/var/log/mysqld.log。 只有启动过一次mysql才可以查看临时密码

```
grep 'temporary password' /var/log/mysqld.log
```
> 以下是默认密码信息

```
# grep 'temporary password' /var/log/mysqld.log
2019-04-12T08:47:45.738675Z 1 [Note] A temporary password is generated for root@localhost: DjY2j8AWkp:>
```
> **DjY2j8AWkp** 是密码

2. 使用默认密码登录mysql

```
mysql -uroot -p
```
3. 登录进去 第一件事 修改密码

> 密码部分是你的 密码 （不要直接复制进去执行）

```
ALTER USER 'root'@'localhost' IDENTIFIED BY '密码';
```
> 不出意外会报错

```
ERROR 1819 (HY000): Your password does not satisfy the current policy requirements
```

> 这个其实与validate_password_policy的值有关，validate_password_policy有以下取值；

| Policy | Tests Performed |
|---------|:------------:|
| 0 or LOW   | Length |
| 1 or MEDIUM | Length; numeric, lowercase/uppercase, and special characters |
| 2 or STRONG | Length; numeric, lowercase/uppercase, and special charactersdictionary file | 

> 默认是1，即MEDIUM，所以刚开始设置的密码必须符合长度，且必须含有数字，小写或大写字母，特殊字符。
有时候，只是为了自己测试，不想密码设置得那么复杂，譬如说，我只想设置root的密码为123456。
必须修改两个全局参数。

```
set global validate_password_policy=0; 
```
>再修改密码的长度

```
set global validate_password_length=1;
```
>再次执行修改密码就可以了

```
ALTER USER 'root'@'localhost' IDENTIFIED BY '密码';
```
4. 授权第三方mysql工具登录 mysql

```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'mypassword' WITH GRANT OPTION;
```
> 最后执行 flush privileges; （刷新一下刚才的操作）

```
flush privileges;
```