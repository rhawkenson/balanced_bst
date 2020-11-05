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
    root.left = build_tree(arr[0..(middle-1)]) 
    root.right = build_tree(arr[(middle+1)...arr.length])

    # Last value were not saving to root, only to children
    if root.right != nil && root.left == nil
      root.right = Node.new(root.right)
    elsif root.right == nil && root.left != nil 
      root.left = Node.new(root.left)
    end
    return root
  end 

  def insert(value, current = @root)
    #Find the leaf 
    current.left.data > value ? true : false

    # unless current.left.data == nil and current.right.data == nil 
    #   value < current.data ? insert(value, current.right) : insert(current.right)
    # end
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}" 
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left 
  end


end 
