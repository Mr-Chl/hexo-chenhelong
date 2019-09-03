---
title: js object 拷贝
date: 2019-09-03 18:39:32
tags: object拷贝 
categories: js
---

## 最简单拷贝

```
JSON.parse(JSON.stringify());
这种写法非常简单，而且可以应对大部分的应用场景，但是它还是有很大缺陷的，比如拷贝其他引用类型、拷贝函数、循环引用等情况。
```

## 浅拷贝

```
function clone(target) {
    let cloneTarget = {};
    for (const key in target) {
        cloneTarget[key] = target[key];
    }
    return cloneTarget;
};

```

## 递归循环深拷贝

```
function clone(target) {
    if (typeof target === 'object') {
        let cloneTarget = {};
        for (const key in target) {
            cloneTarget[key] = clone(target[key]);
        }
        return cloneTarget;
    } else {
        return target;
    }
};
```
