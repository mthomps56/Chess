class A
  attr_accessor :var

  def initialize
    @var = 123
  end
end

class Modifier
  def modify(x)
    x = 456
  end
end

a = A.new
mod = Modifier.new

print mod.modify(a.var)
puts
print a.var

    

