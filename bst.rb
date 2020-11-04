class Node
  attr_accessor :left, :right, :data
  def initialize(data)
    @data = data
    @left = nil
    @right = nil 
  end 
end 


class Tree
  attr_accessor :root
  def initialize(arr)
    @arr = arr.sort!.uniq!
    @root = build_tree(@arr)
  end 

  def build_tree(arr)
    middle = arr.length/2
    root = Node.new(arr[middle])

    return root.data if arr.length <= 1
    puts root.data
    root.left = build_tree(arr[0..(middle-1)])
    root.right = build_tree(arr[(middle+1)...arr.length])
    return root
  end 

  
end 
