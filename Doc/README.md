# 删除 Xcode 11创建工程多出的Scenedelegate

1. 删除Scenedelegate
2. 删除Info.plist文件中的Application Scene Manifest配置
3. 删除AppDelegate文件中的两个管理Scenedelegate生命周期代理方法
4. 在AppDelegate中添加window属性

#  API

https://api.github.com/search/repositories?q=SwiftUI&order=desc

# 数据结构
```json
{
  "id":190082368,
  "full_name":"Jinxiansen/SwiftUI",
  "description":"`SwiftUI` Framework Learning and Usage Guide. 🚀 https://jinxiansen.github.io/SwiftUI/",
  "stargazers_count":2577,
  "language":"Swift",
  "owner":{"login": "ivanvorobei", "id": 10995774, "avatar_url": "https://avatars0.githubusercontent.com/u/10995774?v=4"}
}
```

# 工具

JSON解析及格式化验证：https://www.json.cn/ 

JSON 2 swift：[http://www.jsoncafe.com](http://www.jsoncafe.com/) 

# 库的导入

默认情况下用到哪个库就要导入哪个库，无疑增加了很多重复的工作量。如何做到全局导入库？

1. 新建一个用于Swift调用OC的桥接文件Swift-MVC-Bridging-Header.h（工程了添加一个oc文件再删除就可以生成）。
2. 导入系统库或者第三方库（Framework形式） #import <xxx/xx.h>