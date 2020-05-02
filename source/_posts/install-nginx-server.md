---
title: install-nginx_server
date: 2020-04-30 20:26:55
tags: -- centeros7 --nginx --server
categories: --nginx install-nginx
---

## centeros7 安装 nginx

#### 先安装 nginx依赖包

`
  yum install -y pcre-devel 
  yum install -y gcc gcc-c++
  yum install zlib-devel -y
  yum install openssl openssl-devel
`


#### 安装nginx到/usr/local/

` 
  cd /usr/local/
  wget http://nginx.org/download/nginx-1.8.0.tar.gz
  tar -zxvf nginx-1.8.0.tar.gz
  cd nginx-1.8.0
  ./configure
  make && make install
`

#### 添加 nginx 环境变量

`
nginx:/usr/local/nginx
在/etc/profile 中加入配置
`

#### 在配置文件中加入：

`
vim /etc/profile
#nginx configure
export NGINX_HOME=/usr/local/nginx
export PATH=$PATH:$NGINX_HOME/sbin
`
##### 执行 source /etc/profile

`
  source /etc/profile
  nginx -v
`

#### 执行 nginx

`
cd /usr/local/nginx/etc
./nginx -c /usr/local/nginx/conf/nginx.conf
`

