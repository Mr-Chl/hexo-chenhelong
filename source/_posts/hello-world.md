---
title: nginx 执行 ./nginx -s reload 问题
date: 2018-08-10 16:48:28
tags: #文章标签 可以省略
     - nginx
     - 报错
     - reload
categories: #文章分类 可以省略
     - nginx 
---

# 执行nginx -s reload 提示pid 报错

提示信息：
``` 
nginx: [error] open() “/usr/local/nginx/logs/nginx.pid” failed (2: No such file or directory) 
[root@VM_16_6_centos sbin]# 
```
# 解决方法：
执行一下命令就可已启动 不再提示 pid 错误
```
    ./nginx -c /usr/local/nginx/conf/nginx.conf
```