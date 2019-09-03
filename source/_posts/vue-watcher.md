---
title: vue watcher
date: 2019-09-03 18:34:32
tags: vue 
categories: js
---


### 利用 Object.defineProperty 封装vue watch
```
var watch = {
    music:function(newval, Value){
        console.log(data, 'music');
    },
    age: function(newval, Value){
        console.log(data, 'age');
    }
}

var data = {
    music: 123,
    name: '张三',
    age: 19,
}

function setWatcher(data, watch) {
    Object.keys(watch).forEach(v => { // 将watch对象内的key遍历
        observe(data, v, watch[v]); // 监听data内的v属性，传入watch内对应函数以调用
    })
}

/**
 * 监听属性 并执行监听函数
 */
function observe(obj, key, watchFun) {
var val = obj[key]; // 给该属性设默认值
if (!val) { return false; }
Object.defineProperty(obj, key, {
    set: function (newval) {
        const oldval = val; // 旧值
        val = newval;
        watchFun(newval, val); // 赋值(set)时，调用对应函数
    },
    get: function () {
    return val;
    }
})
}

setWatcher(data, watch);  // 注入数据 和 需要watch的属性
data.music += 5;
data.age += 1;

```