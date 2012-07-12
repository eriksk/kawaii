module Kawaii
	class Command
		def self.run command, args
			puts "Command: #{command}"
			puts "args: #{args}"

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
				puts "Kawaii used 'create new game template'"
				puts "But it failed..."
				puts "It wasn't implemented yet"	
			end

			def self.print_help
				puts <<-EOF
Kawaii <3

Commands:

# create new game template
new [name, width(int), height(int), fullscreen(boolean)]
				EOF
			end
	end
end