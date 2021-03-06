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
    start = 0
    finish = arr.length-1
    middle = arr.length/2
    root = Node.new(arr[middle])

    return root.data if start > finish
    root.left = build_tree(arr[0...middle]) 
    root.right = build_tree(arr[middle+1..-1]) 
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
    return visited if current.nil?
    queue.delete_at(0)
    if current.left.nil?
      if current.right.nil?
        visited << current.data 
      else 
        queue << current.right
        visited << current.data
      end
    else 
      queue << current.left unless current.left.nil?
      queue << current.right unless current.right.nil?
      visited << current.data
    end 
      level_order(queue[0], queue, visited)
  end 

  def preorder(current = @root, visited = [])
    return visited if current.nil?
    visited << current.data
    preorder(current.left, visited)
    preorder(current.right, visited)
  end

  def inorder(current = @root, visited=[])
    return visited if current.nil?
    inorder(current.left, visited)
    visited << current.data
    inorder(current.right, visited)
  end 

  def postorder(current = @root, visited=[])
    return visited if current.nil?
    postorder(current.left, visited)
    postorder(current.right, visited)
    visited << current.data
  end 

  def height(value, current = @root, counter = 1)
    return counter if value == current.data
    if value < current.data
      height(value, current.left, counter+=1)
    else 
      height(value, current.right, counter+=1)
    end 
  end 

  def depth(current = @root)
    return 0 if current.nil?
    left_tree = depth(current.left)
    right_tree = depth(current.right)
    
    if left_tree > right_tree
      return left_tree + 1
    else 
      return right_tree + 1
    end
  end 

  def balanced?(current = @root)
    left = depth(current.left)
    right = depth(current.right)
    
    if (left-right).abs <= 1 
      true
    else 
      false
    end 
  end 

  def rebalance
    @root = build_tree(level_order)
  end 


  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}" 
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left 
  end


end 
