const Asteroid = require("./asteroid");
const Util = require("./util");
const Ship = require("./ship");

const CONSTANTS = {
  DIM_X: 800,
  DIM_Y: 600,
  NUM_ASTEROIDS: 6
}

function Game() {
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({pos: Util.randomPos()});
}

Game.prototype.addAsteroids = function addAsteroids() {
  for (let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++) {
    let ast = new Asteroid();
    this.asteroids.push(ast);
  }
}

Game.prototype.draw = function draw(ctx) {
  ctx.clearRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_X);
  ctx.fillStyle = "#000000";
  ctx.fillRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_Y);
  this.ship.draw(ctx);
  this.asteroids.forEach((asteroid) => {
    if (this.isOutOfBounds(asteroid.pos)) {
      asteroid.pos = this.wrap(asteroid.pos)
    }
    asteroid.draw(ctx);
  });
}

Game.prototype.moveObjects = function moveObjects() {
  this.asteroids.forEach((asteroid) => {
    asteroid.move();
  });
}

Game.prototype.isOutOfBounds = function isOutOfBounds(pos) {
  return (pos[0] < 0) || (pos[1] < 0) || (pos[0] > CONSTANTS.DIM_X) || (pos[1] > CONSTANTS.DIM_Y);
}

Game.prototype.wrap = function wrap(pos) {
  return [Util.wrap(pos[0], CONSTANTS.DIM_X), Util.wrap(pos[1], CONSTANTS.DIM_Y)];
}

Game.prototype.checkCollisions = function checkCollisions() {
  for (let i = 0; i < this.asteroids.length; i++) {
    for (let j = i+1; j < this.asteroids.length; j++) {
      let ast1 = this.asteroids[i];
      let ast2 = this.asteroids[j];

      if (ast1.isCollidedWith(ast2)) {
        this.remove(ast1);
        this.remove(ast2);
      }
    }
  }
}

Game.prototype.step = function step() {
  this.moveObjects();
  this.checkCollisions();
}

Game.prototype.remove = function remove(object) {
  idx = this.asteroids.indexOf(object);
  this.asteroids.splice(idx, 1);
}

module.exports = Game;