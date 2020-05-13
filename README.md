# Campus-second-hand-trading-system
A system to simulate second-hand goods trading on campus at graduation

## 基于Servlet + JSP + MVC
数据库使用SQL Server，服务器为Tomcat，IDE为MyEclipse

## 系统设计
![YUotxO.png](https://s1.ax1x.com/2020/05/13/YUotxO.png)
1.用户注册：校园二手交易网站的用户类型分为两种：普通用户、管理员用户。，可以对自己已发布的二手交换信息删除和修改并新发布留言信息。新的管理员用户只能通过已注册的管理员账户中进行注册。当管理员登录进入系统后，可以查看所有普通会员的个人信息并可以执行冻结、启用、删除操作，管理发布资讯信息（滚动公告、新闻资讯），管理目前所有会员已发布的商品并可以增删商品分类等。
2.增加商品信息
3.商品信息管理
4.信息查询：支持模糊查询
5.购物车、订单管理：用户在登陆后选择商品加入购物车，进入到“我的购物车”界面即可提交订单。在提交订单时需填写交货时间、交货地点。页面会显示卖家的收款码。
6.捐赠物品：用户发布商品后，可以选择捐赠自己的二手物品。点击“捐赠”后即可以在首页的“查看捐赠”模块看到捐赠物，并且不需要收费，其他用户可以自行领取。
7.管理员管理
8.资讯发布管理：包含了滚动公告、新闻资讯管理及维护。
9.管理员商品管理：分为已上架物品管理及商品类别管理。
10.注册会员管理：管理员进行登陆操作之后，在注册会员管理模块中可以查看到当前所有已注册的会员账户。
11.交换留言管理：管理员用户可对当前已发表的交换留言执行浏览操作。

## 数据库设计
![YUoBdA.png](https://s1.ax1x.com/2020/05/13/YUoBdA.png)
![YUosit.png](https://s1.ax1x.com/2020/05/13/YUosit.png)
![YUoyJP.png](https://s1.ax1x.com/2020/05/13/YUoyJP.png)
![YUo6Rf.png](https://s1.ax1x.com/2020/05/13/YUo6Rf.png)
![YUo2QS.png](https://s1.ax1x.com/2020/05/13/YUo2QS.png)
![YUoWLQ.png](https://s1.ax1x.com/2020/05/13/YUoWLQ.png)

## 效果图
![YUoHzT.png](https://s1.ax1x.com/2020/05/13/YUoHzT.png)
![YUoqQU.png](https://s1.ax1x.com/2020/05/13/YUoqQU.png)
