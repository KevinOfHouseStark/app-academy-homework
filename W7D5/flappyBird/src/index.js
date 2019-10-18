import FlappyBird from './game';
document.addEventListener("DOMContentLoaded", () => {
  const canvas = document.getElementById('bird-game');
  const game = new FlappyBird(canvas);
  game.restart();
});
