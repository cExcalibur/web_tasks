#!/usr/bin/ruby
require 'yaml'

class Student
  attr_accessor:id,:name,:gender,:age

  def look
    puts"id：#@id,姓名：#@name,性别：#@gender,年龄：#@age"
  end
  def to_s
    "id：#@id,姓名：#@name,性别：#@gender,年龄：#@age"
  end
end

def newname(len)
  chars = ("a".."z").to_a
  newname = ""
  1.upto(len) { |i| newname << chars[rand(chars.size-1)] }
  return newname
end

num=1
students=Array.new

100.times{
  student=Student.new()
  student.name=newname(6)
  student.id=num
  if(rand(2)==1)
    student.gender="男"
  else
    student.gender="女"
  end
  student.age=(rand(6)+15)
  student.look
  students<<student
  num+=1
}

File.open("Student.yaml","wb"){|f| YAML.dump(students,f)}
puts"信息存入成功"
problem = YAML.load(File.open("Student.yaml"))
problem.each{|c| puts"#{c}"}
