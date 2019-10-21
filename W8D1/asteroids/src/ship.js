const MovingObject = require("./moving_object");
const Util = require("./util");

const CONSTANTS = {
  RADIUS: 15,
  COLOR: "#FFFFFF"
};

function Ship(options) {
  options.radius = options.radius || CONSTANTS.RADIUS;
  options.color = options.color || CONSTANTS.COLOR;
  options.vel = options.vel || [0, 0];

  MovingObject.call(this, options);
}

Util.inherits(Ship, MovingObject);

module.exports = Ship;