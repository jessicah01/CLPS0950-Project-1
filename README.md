# Connect 4: MATLAB Edition

![MATLABWindow_fdBA32FqX7](https://user-images.githubusercontent.com/12666237/159749255-573c38f2-ba3b-4167-8471-13a5c7bf1a2d.gif)

Connect 4: MATLAB Edition is a collaborative project for Brown University course CLPS 0950. The primary contributors are Isaac Kim, Jenny Wang, and Jessica Hong.

## About the Game

Connect 4: MATLAB Edition contains a local multiplayer mode, and a "play against the computer" mode. The "play against the computer" mode utilizes a Monte Carlo method/simulation for the Easy, Medium, and Hard modes, varying only on number of simulated games, while the Impossible mode fetches the best move from an API, making it unbeatable.

## Playing the Game

Download the `connect4.mlappinstall` file (found in the Releases tab of Github or in `./build/connect4.mlappinstall`) and execute it on your system. Connect4 will then be accessible via the "Apps" tab of Matlab. *Please ensure you do not attempt to run this app while inside of the code directory!*

### Alternative methods of playing the game

In the case the MATLAB app method fails, you can download the source code, open the `homescreen.mlapp` file, and click "Run" on top.  
As a third backup, a text-based version of the game can be played by executing the code in `game.m`.

## Work breakdown
- Base game logic (excluding win condition validation): Isaac (~5h)
- Win condition validation: Jenny (~15h)
- UI + UI display logic: Jessica (~25h)
- Play against computer modes: Isaac (~20h)
- Tutorial: Jenny (~10h)

## Contributing
We are not accepting external contributions at this time.
