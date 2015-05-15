# Tic Tac Toe

The classic Tic Tac Toe game in Ruby.

### Design

#### The Game

The is the God class that controls the game. It:

- keeps track of all the moves in the current game
- holds the rules for valid moves
- holds the rules for when a game is over

#### The Player

This is a thin class that stores player info.

### The Computer

This class inherits from the Player class
and holds the logic that enables the computer
not to lose.