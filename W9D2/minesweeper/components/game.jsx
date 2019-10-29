import React from 'react';
import Board from './board';
import * as Minesweeper from '../minesweeper';

class Game extends React.Component {
  constructor(props) {
    super(props);
    const board = new Minesweeper.Board(9, 10);
    this.state = { board: board };
    this.updateGame = this.updateGame.bind(this);
    this.restartGame = this.restartGame.bind(this);
  }

  updateGame(tile, flagged) {
    if (flagged) {
      tile.toggleFlag();
    } else {
      tile.explore();
    }

    this.setState({board: this.state.board});
  }
  
  restartGame() {
    const board = new Minesweeper.Board(9, 10);
    this.setState( {board: board} );
  }

  render() {
    let modal;
    if (this.state.board.won()) {
      modal = (
        <div className="modal">
          <div className="modal-window">
            <p>"You won!"</p>
            <button onClick={this.restartGame}>Restart Game!</button>
          </div>
        </div>
      );
    } else if (this.state.board.lost()) {
      modal = (
        <div className="modal">
          <div className="modal-window">
            <p>"You lose!"</p>
            <button onClick={this.restartGame}>Restart Game!</button>
          </div>
        </div>
      );
    }

    return (
      <div className="game">
        {modal}
        <Board board={this.state.board} updateGame={this.updateGame} />
      </div>
    );
  }
}

export default Game;