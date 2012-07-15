class String
	# colorization
	def colorize(text, color_code)
	  "\e[#{color_code}m#{text}\e[0m"
	end

	def red
		colorize(self, 31)
	end
	def green
		colorize(self, 32)
	end
	def yellow
		colorize(self, 33)
	end
	def pink
		colorize(self, 35)
	end
end

module Kawaii
	class Command
		def self.run command, args
			puts ""
			case command
				when "new"
					new_game_template(args)
				when "help"
					print_help()
				else
			end
			puts ""
		end

		private
			def self.new_game_template args
				game_class_name = args.first.capitalize 
				File.open(args.first + ".rb", "w+") do |f|
					f.write <<-EOF
require 'kawaii'

module #{game_class_name}
	class Game < Kawaii::Game
	  
	  def initialize
	    super
	    load_game
	  end
	  
	  def load_game
	  	# TODO: create and load a scene
	  	# example:	
	    # @scene_manager.on_scene_activated lambda {
	   	#	  @scene_manager.push_scene(MySceneClass.new(@scene_manager)) 
	    # }	    	
	  end

	  def before_update
	  	# allows the game to exit
	    exit() if @input.button_down?(Gosu::KbEscape)
	  end
	end
end

# entry point
game = #{game_class_name}::Game.new
game.show
				EOF
				end

				# write config file
				File.open("config.rb", "w+") do |f|
					f.write <<-EOF
# kawaii configuration
resolution:
  width: 800
  height: 600
fullscreen: false
content_root: content
debug: true
					EOF
				end

				puts "Successfully created new game '#{game_class_name}'".green
				puts "Run it with the command: " + "ruby #{args.first}.rb".yellow
			end

			def self.print_help
				puts "Kawaii <3".pink
				puts <<-EOF
Commands:
	new [name] # create new game template
				EOF
			end
	end
end