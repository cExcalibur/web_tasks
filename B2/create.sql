create database message_board;

use message_board;

create table messages(
  id int unsigned not null auto_increment primary key,
  content char(255) not null,
  user_id int not null,
  created_at datetime
)default charset=utf8;

create table users(
  id int unsigned not null auto_increment primary key,
  username char(20) not null,
  password char(20) not null
)default charset=utf8;
