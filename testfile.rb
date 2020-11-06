require './bst.rb'

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(arr)
#p tree

p "Level-order: #{tree.level_order}"
p "Inorder: #{tree.inorder}"
p "Preorder: #{tree.preorder}"
p "Postorder: #{tree.postorder}"