# Flutter GetX 的简单使用

1. 创建项目

```dart

flutter create .

```
2. 安装插件

```dart
  get: ^3.25.6
  dio: ^3.0.10
  webview_flutter: ^1.0.7
```
3. 准备接口

> 这里小声bibi，我偷了掘金插件的接口
> api ：`https://e.xitu.io/resources/github`
> 参数：
>  ```json
>        "category": "upcome",
>        "lang": "dart",
>        "limit": limit,
>        "offset": offset.value * limit.value,
>        "period": "month",
>  ```
