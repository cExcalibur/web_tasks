#!/usr/bin/ruby
require 'yaml'

class Student
  attr_accessor:id,:name,:gender,:age

  def look
    puts"id：#@id,姓名：#@name,性别：#@gender,年龄：#@age"
  end
  def write
    aFile=File.new("Student.yaml","a")
    aFile.syswrite("
    - id: #@id\n
      name: #@name\n
      gender: #@gender\n
      age: #@age\n")
    aFile.close
  end
end

def newname(len)
  chars = ("a".."z").to_a
  newname = ""
  1.upto(len) { |i| newname << chars[rand(chars.size-1)] }
  return newname
end

aFile=File.new("Student.yaml","a")
aFile.syswrite("students:\n")
aFile.close
$num=1
100.times{
  student=Student.new()
  student.name=newname(6)
  student.id=$num
  if(rand(2)==1)
    student.gender="男"
  else
    student.gender="女"
  end
  student.age=(rand(6)+15)
  student.look
  student.write
  $num+=1
}

puts"信息存入成功"
problem = YAML.load(File.open("Student.yaml"))
problem["students"].each{ |c| puts"#{c}\n"}
