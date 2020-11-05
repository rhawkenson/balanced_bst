class Node
  include Comparable
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
    root.left = build_tree(arr[0..(middle-1)]) 
    root.right = build_tree(arr[(middle+1)...arr.length])
    return root

  end 

  def insert(value, current = @root.data)
    if value < current
      insert(value, root.left.data)
    end 
    
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}" 
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left 
  end


end 
