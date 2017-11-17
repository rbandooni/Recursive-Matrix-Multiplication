=begin
Date: 09/26/2017
Class: CS5310	
Assignment: Assignment 3
Author: Rohit Bandooni	
=end
class RecursiveMatrixMul
	attr_accessor :arrSize,:a,:b
	def initialize(a,b,arrSize)
		@arrSize = arrSize
		# @arr1 = Array.new(@arrSize) { |i| Random.rand(10...42)  }
		@arr1 = a
		@arr2 = b
		@arr3 = Array.new(@arrSize/2) { Array.new(@arrSize/2, 0) }		
		@arr3 = mul(@arr1,@arr2)
		# puts "Array 1 "
		# p @arr1
		# puts "Array 2"
		# p @arr2
		# puts "A1 X A2 "

		# p @arr3
		
	end

	def mul(a, b)
		n = a.size
		c = Array.new(n) { |i| [] }
		if n == 1
			c[0] << a[0][0]*b[0][0]
		else
			a11, a12, a21, a22 = MatrixSplitter(a)
			b11, b12, b21, b22 = MatrixSplitter(b)

			c11 = mat_add(mul(a11, b11),mul(a12, b21))

			c12 = mat_add(mul(a11, b12),mul(a12, b22))

			c21 = mat_add(mul(a21, b11),mul(a22, b21))

			c22 = mat_add(mul(a21, b12),mul(a22, b22))
			c = assemble_matrix([c11, c12, c21, c22])
		end
		return c
	end
	def assemble_matrix(mat_list)
		mat_list.flatten!
		rows = columns = mat_list.length**(0.5)
		final_matrix = (0..rows-1).map { |x| [] }

		(0..rows-1).each do |row|
			(0..columns-1).each do |column|
				offset = ( ( row / 2 ) * 8 ) +
				( ( row % 2 ) * 2 ) +
				( ( column / 2 ) * 2 ) +
				column

				final_matrix[row] << mat_list[offset]
			end
		end
		return final_matrix
	end
	def mat_add(mat1, mat2)
		n = mat1.size
		result = n.times.map{ |x| [] }
		(0..n-1).each do |i|
			(0..n-1).each do |j|
				result[i] << mat1[i][j] + mat2[i][j]
			end
		end
		return result
	end
	def MatrixSplitter(mat)
		n = mat.size-1
		nBy2 = mat.size/2

		m11 = (0..nBy2-1).map { |x| mat[x][0..nBy2-1] }
		m12 = (0..nBy2-1).map { |x| mat[x][nBy2..n] }

		m21 = (nBy2..n).map { |x| mat[x][0..nBy2-1] }
		m22 = (nBy2..n).map { |x| mat[x][nBy2..n] }
		return [m11, m12, m21, m22]
	end

end