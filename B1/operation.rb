class Operation
  def add(message,author)
    time=Time.new
    message3=Message.new
    message3.message=message
    message3.author=author
    message3.created_at=time.strftime("%Y-%m-%d %H:%M:%S")
    $messages.insert(0,message3)
    return message3.id
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
        end
      end
      return 1
    end
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
