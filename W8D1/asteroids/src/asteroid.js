const MovingObject = require("./moving_object");
const Util = require("./util");

const CONSTANTS = {
  COLOR: "#FF0000",
  RADIUS: 50
};

function Asteroid(options) {
  options = options || {};
  options.color = options.color || CONSTANTS.COLOR;
  options.radius = options.radius || CONSTANTS.RADIUS;
  options.pos = options.pos || Util.randomPos();
  options.vel = options.vel || Util.randomVec(4);

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;