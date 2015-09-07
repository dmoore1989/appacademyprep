class Friend
  def greeting(name = nil)
    if name == nil
      return "Hello!"
    end
    "Hello, #{name}!"
  end
end
