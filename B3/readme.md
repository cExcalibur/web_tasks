# **数据库表结构**

## **文章表posts**
字段名|类型|描述|
:-------------:|:-------:|:-----------------:
id             |int      |文章ID              
title          |string   |标题
text           |text     |文章内容
created_at     |date     |创建日期
admin_id       |int      |文章的作者ID
updated_at     |date     |更新日期

## **留言表comments**
字段名|类型|描述
:-------------:|:-------:|:-----------------:
id             |int      |留言ID
content        |string   |留言内容
pass           |int      |判断是否通过审核
created_at     |date     |创建日期
post_id        |int      |留言所属的文章ID

## **反馈表feedbacks**
字段名|类型|描述
:-------------:|:-------:|:-----------------:
id             |int      |反馈ID
content        |string   |反馈内容
created_at     |date     |创建日期
nickname       |int      |反馈人昵称

## **管理员账户表admins**
字段名|类型|描述
:-------------:|:-------:|:-----------------:
id             |int      |管理员ID
adminname      |string   |管理员姓名
password       |string   |密码
