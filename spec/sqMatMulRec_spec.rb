=begin
Date: 09/26/2017
Class: CS5310	
Assignment: Assignment 3
Author: Rohit Bandooni	
=end
require 'spec_helper'

describe RecursiveMatrixMul do
	
	before :all do
		@size = 2
		while @size <= 128
			@arr1 = Array.new(@size) { |i| Array.new(@size) { |i| Random.rand(1...100) }}
			@arr2 = Array.new(@size) { |i| Array.new(@size) { |i| Random.rand(1...10) }}
				# i = 0
				# j = 0
				@A = @arr1
				@B = @arr2
				beginning_time = Time.now
				@recObj = RecursiveMatrixMul.new @A,@B,@size
				end_time = Time.now
				milsecTime = (end_time - beginning_time)* 1000
				puts "Time elapsed #{milsecTime} milliseconds for size = #{@size}"
				dataToSend = "#{@size} #{milsecTime}"
				File.open('results.txt', 'a') { |file| file.puts(dataToSend) }
				
			@size *= 2
		end

		# @size = 64
		
	end

	describe "#new" do

		it "should be an be an instance" do
			expect(@recObj).to be_an_instance_of RecursiveMatrixMul
		end


	end

	describe "#matrixMul" do
		it "Row/Column size should be greater than 0" do
			expect(@size).to be > 0
		end

		it "should be a power of 2" do
			expect((@size & (@size - 1))).to eql(0)
		end

		it "should initialize and execute" do
			# @RecursiveMatrixMul.matrixMul(@size)
		end
	end

end