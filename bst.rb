class Node
  include Comparable
  attr_accessor :left, :right, :data
  def <=>(other)
    data <=> other.data
  end 

  def initialize(data)
    @data = data
    @left = nil
    @right = nil 
  end 
end 


class Tree
  def initialize(arr)
    @arr = arr
    @root = build_tree(arr)
  end 

  def build_tree(arr)
    clean_arr = arr.sort.uniq
    Node.new(arr[clean_arr.length/2])
  end 


end 




arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(arr)
