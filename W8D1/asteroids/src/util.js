const Util = {
  inherits(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },

  randomVec(length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },

  // Scale the length of a vector by the given amount.
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  },

  randomPos() {
    let x = Math.random() * 800;
    let y = Math.random() * 600;
    return [x, y];
  },

  wrap(coordinate, max) {
    if (coordinate > max) {
      return coordinate % max;
    } else if (coordinate < 0) {
      return max;
    } else { 
      return coordinate;
    }
  }
};

module.exports = Util;