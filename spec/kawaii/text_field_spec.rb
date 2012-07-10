require 'spec_helper'

module Kawaii
	describe TextField  do
			
		before(:each) do 
			@text_field = TextField.new
		end

		describe "#set_text" do
			it "should be able to change the text" do
				@text_field.set_text "Hello World!"
				@text_field.text.should == "Hello World!"
			end
		end
	end
end