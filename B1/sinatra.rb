require_relative 'operation.rb'
require 'sinatra'

class Message
  attr_accessor:id,:message,:author,:created_at;

  def initialize
    if $messages.length==0
      @id=1
    else
      @id=$messages.at(0).id+1
    end
  end
end

configure do
  $messages=[]
end



get'/'do
  if params['id'].nil? || params['author'].nil?
    @on_screen="所有留言"
    @messages=$messages
    erb:index
  elsif params['id']=="" && params['author']==""
    @tip="未输入搜索内容"
    erb:error
  elsif params['id'].length>0 && params['author'].length>0
    @tip="请输入id或作者"
    erb:error
  elsif params['id']==""
    operation=Operation.new
    @messages=operation.search(params['author'])
    @on_screen="筛选结果"
    erb:index
  else
    operation=Operation.new
    @messages=operation.search(params['id'].to_i)
    @on_screen="筛选结果"
    erb:index
  end
end


post'/add'do
  operation=Operation.new
  if params['message'].length<10 || params['author']==""
    @tip="输入内容不少于10字，作者不能为空."
    erb:error
  else
    operation.add(params['message'],params['author'])
    @messages=$messages
    @on_screen="增加留言成功"
    erb:success
  end
end

get'/delete/:id'do
  operation=Operation.new
  if params['id'].to_i==0
    @tip="删除留言失败，请输入正确的id."
    erb:error
  elsif operation.delete(params['id'].to_i)==0
    @tip="删除留言失败，请输入正确的id."
    erb:error
  else
    operation.delete(params['id'].to_i)
    @on_screen="删除留言成功"
    erb:success
  end
end
