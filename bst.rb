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
  def initialize(entered_arr)
    @arr = entered_arr.sort.uniq
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
    if value < current.data
      if current.left.nil?
        current.left = Node.new(value)
      else 
        insert(value, current.left)
      end
    else
      if current.right.nil?
        current.right = Node.new(value)
      else 
        insert(value, current.right)
      end 
    end 
  end

  def delete(value, current = @root, previous = @root)
    if value == current.data
      if previous.left == current #left side of tree 
        if current.left.nil? #one child on right
          previous.left = current.right 
        else
          if current.right.nil? #one child on left
            previous.left = current.left
          else #two children 
            node = current.right
            replacement = node.left
            delete(replacement.data)
            previous.left = replacement
            replacement.left = current.left
            replacement.right = current.right
          end
         end 
      else #right side of tree 
        if current.left.nil? #one child on right
          previous.right = current.right 
        else 
          if current.right.nil? #one child on left
          previous.right = current.left 
          else #two children 
            if previous == current #delete level 1 root 
              node = current.right
              replacement = node.left
              delete(replacement.data)
              @root = replacement
              replacement.left = previous.left
              replacement.right = previous.right
            else 
              node = current.right
              replacement = node.left
              delete(replacement.data)
              previous.right = replacement
              replacement.left = current.left
              replacement.right = current.right
            end 
          end
         end 
      end 
    else 
      if value > current.data
        delete(value, current.right, current)
      else 
        delete(value, current.left, current)
      end
    end
  end 

  def find(value, current = @root)
    if value == current.data
      puts "The information you are looking for is:"
      p current
    else 
      if value < current.data
        find(value, current.left)
      else 
        find(value, current.right)
      end 
    end 
  end 

  def level_order(current = @root, queue = [], visited = [])
    return visited if visited.length >= 11
    queue.delete_at(0)
    queue << current.left unless current.left.nil?
    queue << current.right unless current.right.nil?
    visited << current.data
    level_order(queue[0], queue, visited)
  end 


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}" 
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left 
  end


end 
