Overview
==========

This is a toy robot simulator. It simulates placement and navigation of a robot on a grid. 
This simulator will not allow placement or navigation of the robot outside the grid. 
A robot can be navigated only after it is placed on the grid

The grid size in this example is 5x5.

The commands accepted by the simulator are:-

* PLACE X,Y,F: This will put the toy robot on the table in position X,Y and facing F i.e. NORTH(N), SOUTH(S), EAST(E) or WEST(W). 
* MOVE: This will move the toy robot one unit forward in the direction it is currently facing.
* LEFT and RIGHT: These will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
* REPORT: This will announce the X,Y and direction of the robot on to the standard output

In this example, the commands are read out of a text file provided to the simulator.
Each command in the text file is on a new line.

##Installation


####Prerequisites


- Ruby 2.x.x
- Bundler gem (can be installed using gem install bundler)

You can git clone this repository onto your machine and 'bundle install' to have all the dependancies needed. 


####Dependancies

RubyGems used:-

- RSpec 3.0

This application has been successfully run and tested on Ruby 2.0.0p481 with RSpec 3.0.0

##Instructions for running the application

This application can be run from the command line using the following command

<code>rake simulate[testdata/data.in]</code>

The parameter inside the square brackets is a file that contains the commands that need to be handled by the simulator.

##More about this Toy Robot Simulator

The usage of the MVC design pattern in this software, seperating the routing of commands (Simulator) , the actual business logic (Robot) and 
the view (RobotView) allows for the below mentioned extensions.
	
This simulator can be extended to support more commands, by adding more methods to the Robot Class. 
Since dynamic method invokation is used, the simulator as such need not be modified for additional command support 

While the report command today simply prints the current position and direction onto the console, it can be extended
to show a graphical representation of the simulation by extending the RobotView Class
 
