# Week 1 - Ruby
# Day 2
#
# Problem: The Tree class was interesting, bit it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a nested
# structure of hashes. You should be able to specify a tree like this:
#
#   {'grandpa' => {
#           'dad' => {'child 1' => {}, 'child 2' => {} }, 
#           'uncle' => {'child 3' => {}, 'child 4' => {} }
#      }
#   }

class Tree
	attr_accessor :children, :node_name

	def initialize(tree = {})
		tree.each_pair do |key, value|
			@node_name = key
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