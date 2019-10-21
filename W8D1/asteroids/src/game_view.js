const Game = require("./game");

function GameView(game, ctx) {
  this.ctx = ctx;
  this.game = game;
}

GameView.prototype.start = function() {
  setInterval(function() {
    this.game.draw(this.ctx);
    this.game.step();
  }.bind(this), 20);
}

module.exports = GameView;