require './bst.rb'

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
#arr = Array.new(15) { rand(1..100)}
arr = Array.new(15) { rand(1..100) }
tree = Tree.new(arr)



# 2. Confirm that the tree is balanced by calling `#balanced?`
p tree.balanced?

# 3. Print out all elements in level, pre, post, and in order
p tree.level_order
p tree.postorder
p tree.preorder
p tree.inorder

# 4. try to unbalance the tree by adding several numbers > 100
tree.insert(1233)
tree.insert(999)
tree.insert(782)

# 5. Confirm that the tree is unbalanced by calling `#balanced?`
p tree.balanced?

# 6. Balance the tree by calling `#rebalance`
tree.rebalance

# 7. Confirm that the tree is balanced by calling `#balanced?`
p tree.balanced?

# 8. Print out all elements in level, pre, post, and in order
p tree.level_order
p tree.postorder
p tree.preorder
p tree.inorder