require 'spec_helper'

module Kawaii
	describe Node do

		before(:each) do 
			@node = Node.new
		end

		it "should have a position vector" do
			@node.should respond_to :position
		end

		it "should have a velocity vector" do
			@node.should respond_to :velocity
		end

		it "should have a gravitational vector" do
			@node.should respond_to :gravity
		end

		it "should have a rotation" do
			@node.should respond_to :rotation
		end

		it "should default to not static" do
			@node.static.should_not be_true
		end


		describe "should have its children accessible" do
			it "should respond to children" do
				@node.should respond_to :children
			end
		end

		describe "#add_child" do
			it "should be able to add children" do
				@node.add_child Node.new
				@node.children.size.should == 1
			end
		end

		describe "#remove_child" do
			it "should be able to remove children" do
				@node.add_child Node.new
				@node.remove_child(@node.children.first)
				@node.children.size.should == 0
			end
		end

		describe "#has_children" do
			it "should be able to tell if it has any children" do
				@node.has_children?.should be_false
				@node.add_child Node.new
				@node.has_children?.should be_true
			end
		end

		describe "#update" do
			it "should respond to update" do
				@node.should respond_to :update
			end
		end

		describe "#draw" do
			it "should respond to draw" do
				@node.should respond_to :draw
			end
		end

		describe "#count" do
			it "should be able to count itself and its children" do
				(0..15).each do 
					@node.add_child Node.new
				end
				@node.count.should == @node.children.size + 1
			end
		end
	end
end