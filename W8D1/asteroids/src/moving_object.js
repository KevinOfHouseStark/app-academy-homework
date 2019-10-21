function MovingObject(options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}

MovingObject.prototype.draw = function draw(ctx) {
  ctx.fillStyle = this.color;

  ctx.beginPath();
  ctx.arc(
    this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false
  );
  ctx.fill();
}

MovingObject.prototype.move = function move() {
  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];

  // if (this.game.isOutOfBounds(this.pos)) {
  //   this.pos = this.game.wrap(this.pos);
  // }
}

MovingObject.prototype.isCollidedWith = function isCollidedWith(otherObject) {
  
  distance = this.distanceBetween(this.pos, otherObject.pos);
  sumRadii = (this.radius + otherObject.radius);
  return distance < sumRadii;
}

MovingObject.prototype.distanceBetween = function distanceBetween(pos1, pos2) {
  // sqrt((pos1[0] - pos2[0])^2 + (pos1[1] - pos2[1])^2)
  return Math.sqrt(Math.pow(pos1[0] - pos2[0], 2) + Math.pow(pos1[1] - pos2[1], 2));
}

module.exports = MovingObject;