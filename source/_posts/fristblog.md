---
title: nginx 执行 ./nginx -s stop 一系列问题记录一下 
date: 2018-08-10 16:48:28
tags: #文章标签 可以省略
     - nginx
     - 报错
categories: #文章分类 可以省略
     - nginx 
---

# nginx ./nginx -s stop 报错
执行./nginx -s stop 提示一下报错信息
```
[emerg] 10352#3232: unknown directive "" in E:/nginx-1.8.1/conf/nginx.conf:3
```
查看nginx/nginx.conf 却没有发现问题

该有个空格都有，就是第三行报错，第三行注释，第四行报错

在经过百度（虽然百度很坑）之后， 结论是nginx/nginx.conf文件被记事本编辑并保存过（好坑有木有）

# 解决办法：
重新见一个nginx.conf 文件 把原来的配置项粘贴过来 替换就可以了 
