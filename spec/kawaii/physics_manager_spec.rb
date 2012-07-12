require 'spec_helper'

module Kawaii
	describe PhysicsManager do
		before(:each) do
			@phys_man = PhysicsManager.new
		end

		describe "properties" do
			it "should have an object space" do
				@phys_man.should respond_to :space
			end
		end

		describe "entities" do
			it "should contain a list of entities" do
				@phys_man.should respond_to :entities
			end

			describe "#add_physics_entity" do
				it "should be able to add entities" do
					@phys_man.should respond_to :add_physics_entity
				end
				it "should raise error about non-physics entities" do
					lambda{
						@phys_man.add_physics_entity(Entity.new(nil))
					}.should raise_error(WrongTypeError)
				end
				it "should add physics entities" do
					@phys_man.add_physics_entity(PhysicsEntity.new :circle, {:radius => 16})	
					@phys_man.entities.size.should be(1)
				end
			end

			describe "#remove_physics_entity" do
				it "should remove physics entities" do
					entity = PhysicsEntity.new :circle, {:radius => 16}
					@phys_man.add_physics_entity(entity)	
					@phys_man.remove_physics_entity(entity)
					@phys_man.entities.size.should be(0)
				end
			end
		end
	end
end