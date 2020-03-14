# hellossm

#### 介绍
SSM框架搭建的基于书院制下的宿舍信息管理系统

#### 软件架构
软件架构说明
本项目采用SSM框架搭建，后续会更新为SpringBoot + Vue 搭建项目。

##### 项目简介：
本项目为基于SSM框架的JavaWeb项目，项目名全称 "宿舍信息管理系统" ，是专门为方便基于宿舍制下的学生管理而打造的一个管理系统。

##### 项目功能模块：

- 学生管理：学生信息的基本操作。
- 管理员管理：管理员信息的基本操作，包括管理员的CRUD以及授权，数据导出功能。
- 宿舍管理：主要用于日常维护宿舍信息，包括宿舍简介、宿舍荣誉以及宿舍所辖学生信息。
- 访客管理：主要用于记录访客信息，以方便宿舍管理员对访客的日常管理。
- 系统统计：此模块尚未开发，主要用于分析系统功能之间的各个性能数据。

##### 项目截图：

首页（动态效果）

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/094927_b587678d_5664485.png "宿管系统-首页.png")

主页面

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/094955_83c0d4f1_5664485.png "宿管系统-主页面.png")

学生信息展示页：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095016_9548c663_5664485.png "宿管系统-学生信息展示页.png")

学生添加信息展示页：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095029_776daf05_5664485.png "宿管系统-学生添加信息.png")

功能包括CRUD以及学生信息的导出功能，为了节省时间，这里就不一一演示了。

下面是管理员的信息展示页面：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095044_66cb629f_5664485.png "管理员信息展示页面.png")

管理员的权限管理，设计之初就是为了学习，没有加复杂的授权校验，只是一个的密码校验授权：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095058_b79ddd70_5664485.png "管理员授权.png")

导出数据信息：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095111_4e3e5c51_5664485.png "管理员信息导出功能.png")

宿舍信息展示页面（CRUD功能就不一一演示了，只演示信息展示页面）：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095132_043014d7_5664485.png "宿舍信息展示.png")

访客信息：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095148_06f5b7d9_5664485.png "访客信息展示.png")

来访登记（手机端）：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095220_80d4fb2d_5664485.jpeg "访客登记.jpg")

访客日志：

![输入图片说明](https://images.gitee.com/uploads/images/2020/0314/095257_c4d3a7f0_5664485.png "访客日志.png")

> 基于SSM框架的宿舍信息管理系统就简单介绍到这里，后续会把它改造成基于SpringBoot的宿舍信息管理系统，期待更新吧。

#### 安装教程

直接fork本项目，到idea中运行即可，非常简单。

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request