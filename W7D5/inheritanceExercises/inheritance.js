Function.prototype.inherits = function (SuperClass) {
  function Surrogate () {};
  Surrogate.prototype = SuperClass.prototype; 
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

function MovingObject() { }
MovingObject.prototype.asteroidInAShip = function () {
  console.log("Asteroid has collided with ship!");
}

// function Ship() { }
// Ship.inherits(MovingObject);

// function Asteroid() { }
// Asteroid.inherits(MovingObject);

// const ship1 = new Ship();
// ship1.asteroidInAShip();

Function.prototype.inherits2 = function (SuperClass) {
  this.prototype = Object.create(SuperClass.prototype);
  this.prototype.constructor = this;
}

// function Ship() { }
// Ship.inherits2(MovingObject);

// function Asteroid() { }
// Asteroid.inherits2(MovingObject);

// const ship1 = new Ship();
// ship1.asteroidInAShip();
