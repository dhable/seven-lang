=begin
	Week 1 - Ruby
	Day 2

	Problem: The Tree class was interesting, bit it did not allow you to specify
	a new tree with a clean user interface. Let the initializer accept a nested
	structure of hashes. You should be able to specify a tree like this:

	  {'grandpa' => {
	          'dad' => {'child 1' => {}, 'child 2' => {} }, 
	          'uncle' => {'child 3' => {}, 'child 4' => {} }
	     }
	  }
=end

class Tree
	attr_accessor :children, :node_name

	def initialize(tree = {})
		# loop through each top level key/value pair. by data structure definition, there should
		# only be one element that matches this so this is the current node's information.
		tree.each_pair do |key, value|
			@node_name = key
			# Using inject on the children value will cause the current_child to be a key/value
			# mapping of each child. This is then collected into a list of Tree objects.
			@children = value.inject([]) { |children, current_child| children.push Tree.new({current_child[0] => current_child[1]}) }
		end
	end

	def visit_all( &block )
		visit &block
		children.each do |c|
			c.visit_all &block
		end
	end

	def visit( &block )
		block.call self
	end
end

new_ruby_tree = Tree.new({'grandpa' => {
          'dad' => {'child 1' => {}, 'child 2' => {} }, 
          'uncle' => {'child 3' => {}, 'child 4' => {} }}})

puts "visiting a node"
new_ruby_tree.visit { |node| puts node.node_name }
puts

puts "visiting entire tree"
new_ruby_tree.visit_all { |node| puts node.node_name }