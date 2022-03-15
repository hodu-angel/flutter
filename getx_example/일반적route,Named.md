# 일반적인 라우트 vs Named 라우트
- **일반적인 라우트 페이지 이동**
> Navigator
```
...
onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> const Home()));
}
...
```
<br>

> Get
```
...
onTap: (){
    Get.to(const Home());
}
...
```

<br><br><br>

- **Named 라우트 페이지 이동**
> Navigator
```
...
onTap: (){
    Navigator.pushNamed(
    context, routeName);
}
...
```
<br>

> Get
```
...
onTap: (){
    Get.toNamed(page);
}
...
```

---

<br>

- **일반적인 라우트 쌓인 페이지 모두 삭제 후 이동**
> Navigator
```
...
onTap: (){
    Navigator.pushAndRemoveUtil(
    context, MaterialPageRoute(builder: (_)=> const Home()), (route) => false);
}
...
```
<br>

> Get
```
...
onTap: (){
    Get.offAll(const Home());
}
...
```

<br><br><br>

- **Named 라우트 쌓인 페이지 모두 삭제 후 이동**
> Get
```
...
onTap: (){
    Get.offAllNamed(page);
}
...
```

---

<br>

- **Named 라우트 현재 페이지 삭제 후 이동**
```
...
onTap: (){
    Get.offNamed(page);
}
...
```