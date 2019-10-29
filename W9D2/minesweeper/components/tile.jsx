import React from 'react';

class Tile extends React.Component{
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    let flagged = (event.altKey ? true : false);
    this.props.updateGame(this.props.tile, flagged);
  }

  render() {
    const tile = this.props.tile;
    let text, klass, bombCount;
    if (tile.explored) {
      if (tile.bombed) {
        klass = "bombed";
        text = "💣";
      } else {
        klass = "explored";
        bombCount = tile.adjacentBombCount();
        text = (bombCount === 0 ? "" : `${bombCount}`);
      }
    } else if (tile.flagged) {
      klass = 'flagged';
      text = "🇺🇸";
    } else {
      klass = "unexplored";
    }

    klass = `tile ${klass}`;

    return (
      <div className={klass} onClick={this.handleClick}>{text}</div>
    );
  }
}

export default Tile;