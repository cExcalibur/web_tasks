require 'sinatra'
require 'sinatra/session'
require 'active_record'
require 'yaml'
require_relative 'Model.rb'

set:session_fail,'/signup'
set :session_secret, 'So0perSeKr3t!'

get'/'do
  session!
  if params['id'].nil? || params['username'].nil?
    @on_screen="所有留言"
    @messages=Message.all
    erb:index
  elsif params['id']=="" && params['username']==""
    @tip="未输入搜索内容"
    @url="/"
    erb:error
  elsif params['id'].length>0 && params['username'].length>0
    @tip="请输入id或作者"
    @url="/"
    erb:error
  elsif params['id']==""
    use = User.find_by_username(params['username'])
    if use.nil?
      @tip="无此作者"
      @url="/"
      erb:error
    else
      @messages = use.message
      @on_screen = "筛选结果"
      erb:index
    end
  else
    @messages=Message.where(id:params['id'].to_i)
    @on_screen="筛选结果"
    erb:index
  end
end

post'/add'do
  session!
  if Message.create(:content=>params['content'],:user_id=>session['id']).valid?
    @tip="增加留言成功"
    @url="/"
    erb:success
  else
    @tip="输入内容不少于10字"
    @url="/"
    erb:error
  end
end

get'/delete/:id'do
  session!
  if params['id'].to_i==0
    @tip="删除留言失败，请输入正确的id."
    @url="/"
    erb:error
  elsif Message.delete(params['id'].to_i)==0
    @tip="删除留言失败，请输入正确的id."
    @url="/"
    erb:error
  else
    @tip="删除留言成功"
    @url="/"
    erb:success
  end
end

get'/signup'do
  erb:signup
end

post'/signup'do
  if params['judge']=="1"
    if params['name']=="" || params['password']==""
      @tip="用户名或密码不能为空"
      @url="/signup"
      erb:error
    elsif User.create(:username=>params['name'],:password=>params['password']).valid?
      @tip="注册成功"
      @url="/signup"
      erb:success
    else
      @tip="用户名已存在"
      @url="/signup"
      erb:error
    end
  else
    user=User.find_by_username(params['name'])
    if user.nil?
      @tip="用户名不存在"
      @url="/signup"
      erb:error
    elsif user.password==params['password']
      session_start!
      session['id']=user.id
      redirect('/')
    else
      @tip="密码错误"
      @url="/signup"
      erb:error
    end
  end
end

get'/change'do
  session!
  erb:change
end

post'/modify'do
  user=User.find_by_id(session['id'])
  if user.password==params['current_password']
    if params['modify_password']==""
      @url='/'
      @tip="修改密码不能为空"
      erb:error
    elsif params['modify_password']==params['confirm_password']
      user.password=params['modify_password']
      user.save
      @url='/'
      @tip="修改密码成功"
      erb:success
    else
      @url='/'
      @tip="两次密码输入不一致"
      erb:error
    end
  else
    @url='/'
    @tip="请输入正确密码"
    erb:error
  end
end

get'/logout'do
  session_end!
  redirect('/signup')
end

after do
  ActiveRecord::Base.connection.close
end
