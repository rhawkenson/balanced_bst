require './bst.rb'

arr = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]
tree = Tree.new(arr)
#p tree

tree.insert(100)
tree.insert(323)
tree.pretty_print
p tree.rebalance

