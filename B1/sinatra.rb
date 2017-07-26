load 'operation.rb'
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

time=Time.new
$messages=Array.new
message1=Message.new
message1.message="1"
message1.author="2"
message1.created_at=time.strftime("%Y-%m-%d %H:%M:%S")
$messages.insert(0,message1)
message2=Message.new
message2.message="3"
message2.author="4"
message2.created_at=time.strftime("%Y-%m-%d %H:%M:%S")
$messages.insert(0,message2)

get'/'do
  if params['id'].nil? || params['author'].nil?
    @on_screen="所有留言"
    @messages=$messages
    erb:index
  elsif params['id']=="" && params['author']==""
    @tip="未输入搜索内容"
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
    redirect to('/')
  end
end

get'/delete/:id'do
  operation=Operation.new
  operation.delete(params['id'].to_i)
  erb:delete
end
