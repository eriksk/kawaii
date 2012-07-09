require 'spec_helper'

module Kawaii
	describe NodeManager do
		before(:each) do
			@node_manager = NodeManager.new
		end

		it "should have a list of nodes" do
			@node_manager.should respond_to :nodes
			@node_manager.nodes.should == []
		end

		describe "#clear" do
			it "should be able to remove all nodes" do
				@node_manager.add Node.new
				@node_manager.nodes.size.should_not == 0

				@node_manager.clear
				@node_manager.nodes.size.should == 0
			end
		end

		describe "#add" do
			it "should be able to add nodes" do
				(1..15).each do
					@node_manager.add Node.new
				end
				@node_manager.nodes.size.should == 15
			end
		end

		describe "#remove" do
			it "should be able to remove nodes" do
				(1..15).each do
					@node_manager.add Node.new
				end
				@node_manager.nodes.size.should == 15
				@node_manager.nodes.each do |node|
					@node_manager.remove node
				end
				@node_manager.nodes.size.should == 0
			end
		end

		describe "#update" do
			it "should be able to update itself" do
				@node_manager.should respond_to :update
			end
		end

		describe "#draw" do 
			it "should be able to draw itseld" do
				@node_manager.should respond_to :draw
			end
		end
	end
end