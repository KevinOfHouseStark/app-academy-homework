import React from 'react';
import Tile from './tile';

class Board extends React.Component {
  constructor(props){
    super(props);
    this.renderRows = this.renderRows.bind(this);
    this.renderTiles = this.renderTiles.bind(this);
    }

  render() {
    const board = this.props.board;
    return (
      <div className="board">
        {this.renderRows()}
      </div>
    )
  }

  renderRows() {
    const board = this.props.board;
    return board.grid.map ( (row, i) => {
      return(
      <div key={`row-${i}`} className="row">
        {this.renderTiles(row, i)}
      </div>
      );
    });
  }

  renderTiles(row, i) {
    const board = this.props.board;
    return row.map ((tile, j) => {
      return (
        <Tile tile={tile}
        updateGame={this.props.updateGame}
        key={((i + (10 * j + 1)) * (j * i + 1))}
         />
      );
    });
  }
}

export default Board;