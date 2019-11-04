import React from 'react';

class PokemonIndex extends React.Component {

  
  componentDidMount() {
    debugger;
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <ul>
        {this.props.pokemon.map(poke => <li key={poke.id}>
          <img className="thumbnail" src={poke.image_url} />
          {poke.name}
        </li>)}
      </ul>
    );
  }
}

export default PokemonIndex;