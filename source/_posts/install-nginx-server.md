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

```
  cd /usr/local/
  wget http://nginx.org/download/nginx-1.8.0.tar.gz
  tar -zxvf nginx-1.8.0.tar.gz
  cd nginx-1.8.0
  ./configure --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module
  make && make install
```

#### 添加 nginx 环境变量

```
nginx:/usr/local/nginx
在/etc/profile 中加入配置
```

#### 在配置文件中加入：

```
vim /etc/profile
#nginx configure
export NGINX_HOME=/usr/local/nginx
export PATH=$PATH:$NGINX_HOME/sbin
```
##### 执行 source /etc/profile

```
  source /etc/profile
  nginx -v
```

#### 执行 nginx

```
cd /usr/local/nginx/etc
./nginx -c /usr/local/nginx/conf/nginx.conf
```

#### 使用systemctl 启动nginx

>  /usr/lib/systemd/system/目录下面新建一个nginx.service文件

> 编辑 nginx.service

```
vim /usr/lib/systemd/system/nginx.service
```

> 赋予可执行的权限。
```
chmod +x /usr/lib/systemd/system/nginx.service
```

> 添加以下内容
```[Unit]                                                                                      //对服务的说明
Description=nginx - high performance web server //描述服务
After=network.target remote-fs.target nss-lookup.target//描述服务类别
[Service]       //服务的一些具体运行参数的设置
Type=forking      //后台运行的形式
PIDFile=/usr/local/nginx/logs/nginx.pid    //PID文件的路径
ExecStartPre=/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf   //启动准备
ExecStart=/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf  //启动命令
ExecReload=/usr/local/nginx/sbin/nginx -s reload   //重启命令
ExecStop=/usr/local/nginx/sbin/nginx -s stop      //停止命令
ExecQuit=/usr/local/nginx/sbin/nginx -s quit   //快速停止
PrivateTmp=true    //给服务分配临时空间
[Install]
WantedBy=multi-user.target //服务用户的模式
```

> 启动服务
```
  // 重载systemctl命令
  systemctl daemon-reload
  // 启动nginx
  systemctl start nginx.service
```
