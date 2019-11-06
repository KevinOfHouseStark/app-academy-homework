import React from 'react';

const PokemonIndexItem = pokemon => {
return <li>
    <span>{pokemon.name}</span>
    <img className="thumbnail" src={pokemon.image_url} />
  </li>
};

export default PokemonIndexItem;