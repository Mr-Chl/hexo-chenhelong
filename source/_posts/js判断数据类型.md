---
title: js判断数据类型
date: 2019-11-29 14:17:54
tags: js
categories: 判断数据类型
---

## JavaScript定义了7种基本数据类型：

* Symbol (ES6)
* String
* Number
* Null
* Boolean
* Undefined
* Object

## 定义变量的方法：

*  var
*  let (ES6)
*  const (ES6)

## 判断数据类型的方法

### 一、typeof

>调用typeof方法时会返回以下几种：

  *  symbol
  *  string
  *  number
  *  boolean
  *  undefined
  *  object
  *  function

```
  typeof Symbol(); // symbol

  typeof 'abc'; // string

  typeof 123; // number

  typeof NaN; // number

  typeof true; // boolean

  typeof undefined; // undefined

  typeof {a:1}; // object

  typeof [1,2,3]; // object

  typeof function a(){}; // function

  typeof null; // object

```
### 二、instanceof

>instanceof和constructor都是用于实例和构造函数的对应，可以弥补typeof无法区分数组和对象的问题

```
[1,2,3] instanceof Array; // true

var a = {name: 1};
a instanceof Object; // true

1 instanceof Number; // false
```
### 三、constructor

```
var num = 1;
num.constructor === Number; // true

var arr = [1, 2, 3];
arr.constructor === Array; // true

```

### 四、Object.prototype.toString.call()

```
var a = {name: 1};
Object.prototype.toString.call(a); // [object Object]

var b = new Date();
Object.prototype.toString.call(b); // [object Date]

Object.prototype.toString.call(null); // [object Null]

Object.prototype.toString.call(undefined); // [object Undefined]

function a(){
	console.log(Object.prototype.toString.call(arguments)); // [object Arguments]
}
```

