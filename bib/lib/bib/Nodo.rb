Node = Struct.new(:value, :next, :previous)

class Node
	include Comparable
	def <=> other
		value <=> other.value
	end
end