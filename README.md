#  iLegym - 乐健一键跑步签到 - iOS版

## 效果展示

### iOS端

<img src="http://billdc.synology.me:1234/images/2022/04/05/iLegym_iOS_home.png" alt="iLegym_iOS_home.png" style="zoom: 33%;" /><img src="http://billdc.synology.me:1234/images/2022/04/05/iLegym_iOS_login.png" alt="iLegym_iOS_login.png" style="zoom: 33%;" />

### macOS端



![iLegym_mac_home.png](http://billdc.synology.me:1234/images/2022/04/05/iLegym_mac_home.png)

![iLegym_mac_login.png](http://billdc.synology.me:1234/images/2022/04/05/iLegym_mac_login.png)

## 系统需求&开发说明

- Universal App，支持iPhone，iPad，和Mac
- iOS/iPadOS版本要求：iOS 15.0 / iPadOS 15.0或更高
- macOS版本要求：macOS Montery 12.0或更高
    - 支持搭载Apple Silicon的Mac和搭载Intel芯片的Mac




- 本程序使用Swift语言，SwiftUI框架开发。

## 特性说明

- 采用自认为非常美观的符合Apple设计规范的UI设计
- 支持黑暗模式（自动切换）
- 自动保存用户账号密码，不必每次登录
- 支持Taptic震动马达

## 开发状态&最新版本

**正式版已发布**

- 1.0.0

    适配Mac，修复若干问题

- 0.3.0

    适配iPad

- 0.2.0

    登录、加载、报名、签到等内容添加请求反馈

- 0.1.0

    实现登录，自动登录，每日活动的报名和签到功能

### 已完成功能

- 登录
- 活动报名
- 活动打卡

### 待完成功能

- 跑步上传（预计2.0版本上线）
- 上课签到（预计3.0版本上线）

## 安装说明

### 如何安装移动端版

1. 从[release](https://github.com/Bill-Haku/iLegym/releases)或者其他地方下载本程序的**源代码**并解压。
2. 在Mac上使用Xcode打开iLegym.xcodeproj文件。我使用的版本是macOS Monterey 12.3 (21E230)，Xcode 13.3 (13E113)。
3. 将你的设备通过数据线连接到你的Mac。
4. 在顶部的target选择iLegym(iOS)，然后在目标设备上选择你的设备。
5. 点击左侧的运行按钮，Xcode会将程序编译并安装到你的设备上。编译前，你可能需要配置Developer Team和Bundle ID才能安装。安装后，你可能需要配置证书才能在你的本地设备上运行。
6. 除此以外，你也可以使用Xcode内置的任意模拟器设备，在你的Mac上的模拟器运行。只需要在第4步中选择你想使用的模拟器设备即可。使用此方法不需要配置Developer Team和证书。

### 如何安装Mac版

1. 从[release](https://github.com/Bill-Haku/iLegym/releases)下载本程序的dmg镜像。
1. 双击打开，将iLegym拖动到Applications文件夹中。
1. 安装完成。现在你可以在你的启动台中找到本程序并运行了。

## 当前版本已知的问题

1. 由于accessToken每天更新一次，在每日的第一次打开App时可能会出现活动列表无法加载出的情况。可行的解决方案是刷新列表，如切换到其他标签页后再切回。

## FAQ

- **为何移动端不能在App Store或TestFlight下载安装？**

    因为如果要在App Store或者TestFlight发布本程序首先需要一个Apple Developer账号，开通这个账号需要支付给Apple每年RMB688的费用。本人无力支付。除此以外，本程序仅作学习用途，不适合发布到App Store。

- 如何判断我的设备是否可以运行本程序？

    一个简单的判断方法是，只要更新到了最新的系统，在5年内发布的所有iPhone, iPad, Mac和iPod touch是可以运行本程序的充分条件。具体请见“系统需求&开发说明”小节。如果你愿意，这一套代码仅需要简单的变化也可以移植到Apple Watch或Apple TV上。

- 能否使用“黑苹果”编译安装运行本程序？

    可以。只要你的“黑苹果”安装了较新的macOS和Xcode。
    
- 能否使用虚拟机编译安装运行本程序？

    可以。只要你安装了较新的macOS和Xcode。

## 开源声明

本仓库是对标本程序的安卓客户端[FuckLegym](https://github.com/Foreverddb/FuckLegym)开发的。但是所有代码均由本人和本仓库的Contributors完成。

本着开源精神，将源码开放，本仓库遵守GPL3.0开源协议, 任何采用了本仓库代码的必须同样开源且遵守并附带GPL3.0协议。

### 特别感谢

- [DdB](https://github.com/Foreverddb)：整理并提供了相关API文档

## 其他

本人为大一学生，课业繁忙，issues可能无法及时回复，请见谅。你可以在我的[GitHub主页](https://github.com/Bill-Haku)找到我的联系方式。

本程序仅作学习用途，使用后果自负。欢迎各位大佬提交PR和issue。
