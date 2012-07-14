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
				width = 800
				height = 600
				fullscreen = false
				game_class_name = args.first.capitalize 
				File.open(args.first + ".rb", "w+") do |f|
					f.write <<-EOF
require 'kawaii'

class #{game_class_name} < Kawaii::Game
  
  WIDTH = #{width}
  HEIGHT = #{height}
  FULLSCREEN = #{fullscreen}
  CONTENT_ROOT = "content"
  
  def initialize
    super WIDTH, HEIGHT, FULLSCREEN, CONTENT_ROOT
    load_game
  end
  
  def load_game
  	# TODO: load code goes here	
  end

  def input
  	# TODO: input goes here
    if button_down?Gosu::KbEscape
      exit
    end  
  end

  def before_update
  	# TODO: game logic goes here
    input
  end

  def after_update
  	# TODO: game logic goes here	
  end
end

# entry point
game = #{game_class_name}.new
game.show
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