class Operation
  def add(message,author)
    time=Time.new
    message1=Message.new
    message1.message=message
    message1.author=author
    message1.created_at=time.strftime("%Y-%m-%d %H:%M:%S")
    $messages.insert(0,message1)
    return message1.id
  end

  def delete(id)
    if id.is_a?Array
      num=0
      id.each do |c|
        $messages.delete_if{|f| f.id==c}
        num+=1
      end
      return num
    else
      $messages.each do |c|
        if c.id==id
          $messages.delete(c)
          return 1
        end
      end
    end
    return 0
  end

  def search(info)
    searchmessages=Array.new
    $messages.each do |c|
      if c.id==info || c.author==info
        searchmessages<<c
      end
    end
    return searchmessages
  end
end
