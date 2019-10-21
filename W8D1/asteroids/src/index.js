const MovingObject = require("./moving_object");
const Asteroid = require("./asteroid");
const Game = require("./game");
const GameView = require("./game_view");

window.MovingObject = MovingObject;

document.addEventListener("DOMContentLoaded", function () {
  const canvasEl = document.getElementById("game-canvas");

  const ctx = canvasEl.getContext("2d");

  let options = {
    pos: [50, 50],
    vel: [50, 50],
    radius: 50,
    color: "#FF0000"
  }

  // const mo = new MovingObject(options);
  // const ast = new Asteroid(options)
  // ast.draw(ctx);
  // ctx.clearRect(0, 0, canvasEl.width, canvasEl.height);
  // ast.move();
  // ast.draw(ctx);
  const g = new Game();
  const gv = new GameView(g, ctx);
  gv.start();
});