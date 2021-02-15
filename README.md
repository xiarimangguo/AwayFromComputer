# AwayFromComputer
## 可能的用途
* ~~您希望远离电脑， 回归现实生活~~
* 希望禁止一些顽固软件的自启
* 禁止孩子玩游戏或使用电脑
## 简介
*###程序采用 `Batch` 语言开发###*  
本项目可以帮助你 `远离电脑` 
### Disable_Programs.bat
* 此程序可以禁用计算机上的某些程序
  #### 使用
  1. 在这个 `.bat` 文件上单击鼠标 `右键` ，选择 `编辑` 
  2. 找到 *List the programs you want to ban below* 字样
  3. 在下面的列表中列出想要禁止的程序，如 `program.exe`  
  4. 保存文件并双击运行
  #### 效果
  * 运行被禁止的程序时，直接闪退  
    *( Tips: 如果某些程序并没有闪退，请 `以管理员身份运行` 这个 `.bat` 文件 )*
### Shutdown.bat
* 此程序可以禁止您使用计算机
  #### 使用
  * 双击运行即可
      ##### *!!!警告!!!:* 
      * *此程序具有轻微的破坏性！！！*  
      * *请先在虚拟机上运行该程序进行测试！！！*
      * *然后决定是否在您的计算机上运行！！！* 
  #### 效果
  * 弹出 **警示框** 并播放 **警示音** 
  * 如果选择 `是` 则 **关机** 
  * 如果选择 `否` 则 **要求输入密码** 
  * 密码错误 则 **关机** 
## 高级
*想要真正远离电脑吗？*  
*一起使用这两个程序，帮助你彻底远离电脑*
##### *!!!警告!!!:*
* *这样做可能会对您的计算机造成 **`严重的`** 破坏性！！！*
* *请先在虚拟机上进行测试！！！*
* *然后决定是否在您的计算机上运行！！！*
#### 准备
* 您的电脑安装了 **`IIS`** 服务器 (或其他服务器软件)  
  *( Tips: [How to install IIS](https://www.howtogeek.com/112455/how-to-install-iis-8-on-windows-8/) )*
* 且网站根目录为 **`C:\inetpub\wwwroot`** 
* 确保 **`IIS`** 网站在局域网可以正常访问
* 上述两个文件在同一目录
#### 步骤
#### Step 1
1. 使用鼠标右键单击 `Disable_Programs.bat` ，选择 `编辑` 
2. 找到 *`::start Shutdown.bat`* 和 *`::exit`* 
3. 删去前面的 *`::`* 
4. 保存文件
#### Step 2
1. 使用鼠标右键单击 `Shutdown.bat` ，选择 `编辑` 
2. 找到 *`start Disable_Programs.bat`* 
3. 删去前面的 *`rem`* 
4. 保存文件
#### Step 3
1. 创建 `Disable_Programs.bat` 的快捷方式
2. 将快捷方式复制到 `Windows` 的 `启动` 文件夹  
  *( Tips: Windows 7/8/10 启动文件夹位置：**`C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp`** )*  
#### Step 4
* 重启电脑即可看到效果
#### 最后
*如何获取密码？*
* 使用另一台设备，访问 `http://192.168.x.x/pass.txt` ( '192.168.x.x'为您的局域网IP地址 )
## 演示
[![Watch the video](https://i.imgur.com/vKb2F1B.png)](https://raw.githubusercontent.com/xiarimangguo/AwayFromComputer/main/Demo.png)
