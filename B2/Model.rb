problem = YAML.load(File.open("配置文件.yaml"))

ActiveRecord::Base.establish_connection(
:adapter => "mysql2",
:host => "127.0.0.1",
:username => "#{problem['username']}",
:password => "#{problem['password']}",
:database => "message_board")

class Message<ActiveRecord::Base
  validates:content,length: { minimum: 10 }
  belongs_to:user
end

class User<ActiveRecord::Base
  validates:username,uniqueness: true
  has_many:message
end
