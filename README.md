# Kawaii <3

[Feature list and development progress](https://github.com/eriksk/kawaii/blob/master/backlog.md)

## What is Kawaii?
Kawaii is a tiny game library for ruby built on top of gosu. It makes it quick and easy to create 2D games.

## How do I use it?
I will show this soon... in the mean time, this is what I'm aiming for.

	kawaii new MyAwesomeGame 800 600

This will create a new game named "MyAwesomeGame" with a default resolution set to 800 x 600.
To run the game just run the command:
	
	ruby my_awesome_game.rb

This is NOT implemented yet though...

## Will this be distributed as a gem?
Yes, sooner or later.

## What kind of features will it have?
Aside from being totally cute (hence the name) it will have:
* Integrated physics with [chipmunk](https://github.com/beoran/chipmunk)
* Content management
	* Sharing sprites with nodes
	* Tiling made easy
* Animated sprites
* Node management, a tree of nodes can be easily created and managed.
* Menu system
* Input management
* Helper functions/math
* Lots of tweenings & other juicyness
* Tiled importer (<del>xml</del> & json)
	* Imports maps from Tiled and draws them

##  Dependencies
* [gosu '0.7.43'](https://github.com/jlnr/gosu)
* [chipmunk](https://github.com/beoran/chipmunk)

## Licence?
MIT