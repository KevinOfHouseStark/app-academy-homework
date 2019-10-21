/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nconst CONSTANTS = {\n  COLOR: \"#FF0000\",\n  RADIUS: 50\n};\n\nfunction Asteroid(options) {\n  options = options || {};\n  options.color = options.color || CONSTANTS.COLOR;\n  options.radius = options.radius || CONSTANTS.RADIUS;\n  options.pos = options.pos || Util.randomPos();\n  options.vel = options.vel || Util.randomVec(4);\n\n  MovingObject.call(this, options);\n}\n\nUtil.inherits(Asteroid, MovingObject);\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\nconst Ship = __webpack_require__(/*! ./ship */ \"./src/ship.js\");\n\nconst CONSTANTS = {\n  DIM_X: 800,\n  DIM_Y: 600,\n  NUM_ASTEROIDS: 6\n}\n\nfunction Game() {\n  this.asteroids = [];\n  this.addAsteroids();\n  this.ship = new Ship({pos: Util.randomPos()});\n}\n\nGame.prototype.addAsteroids = function addAsteroids() {\n  for (let i = 0; i < CONSTANTS.NUM_ASTEROIDS; i++) {\n    let ast = new Asteroid();\n    this.asteroids.push(ast);\n  }\n}\n\nGame.prototype.draw = function draw(ctx) {\n  ctx.clearRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_X);\n  ctx.fillStyle = \"#000000\";\n  ctx.fillRect(0, 0, CONSTANTS.DIM_X, CONSTANTS.DIM_Y);\n  this.ship.draw(ctx);\n  this.asteroids.forEach((asteroid) => {\n    if (this.isOutOfBounds(asteroid.pos)) {\n      asteroid.pos = this.wrap(asteroid.pos)\n    }\n    asteroid.draw(ctx);\n  });\n}\n\nGame.prototype.moveObjects = function moveObjects() {\n  this.asteroids.forEach((asteroid) => {\n    asteroid.move();\n  });\n}\n\nGame.prototype.isOutOfBounds = function isOutOfBounds(pos) {\n  return (pos[0] < 0) || (pos[1] < 0) || (pos[0] > CONSTANTS.DIM_X) || (pos[1] > CONSTANTS.DIM_Y);\n}\n\nGame.prototype.wrap = function wrap(pos) {\n  return [Util.wrap(pos[0], CONSTANTS.DIM_X), Util.wrap(pos[1], CONSTANTS.DIM_Y)];\n}\n\nGame.prototype.checkCollisions = function checkCollisions() {\n  for (let i = 0; i < this.asteroids.length; i++) {\n    for (let j = i+1; j < this.asteroids.length; j++) {\n      let ast1 = this.asteroids[i];\n      let ast2 = this.asteroids[j];\n\n      if (ast1.isCollidedWith(ast2)) {\n        this.remove(ast1);\n        this.remove(ast2);\n      }\n    }\n  }\n}\n\nGame.prototype.step = function step() {\n  this.moveObjects();\n  this.checkCollisions();\n}\n\nGame.prototype.remove = function remove(object) {\n  idx = this.asteroids.indexOf(object);\n  this.asteroids.splice(idx, 1);\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nfunction GameView(game, ctx) {\n  this.ctx = ctx;\n  this.game = game;\n}\n\nGameView.prototype.start = function() {\n  setInterval(function() {\n    this.game.draw(this.ctx);\n    this.game.step();\n  }.bind(this), 20);\n}\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view */ \"./src/game_view.js\");\n\nwindow.MovingObject = MovingObject;\n\ndocument.addEventListener(\"DOMContentLoaded\", function () {\n  const canvasEl = document.getElementById(\"game-canvas\");\n\n  const ctx = canvasEl.getContext(\"2d\");\n\n  let options = {\n    pos: [50, 50],\n    vel: [50, 50],\n    radius: 50,\n    color: \"#FF0000\"\n  }\n\n  // const mo = new MovingObject(options);\n  // const ast = new Asteroid(options)\n  // ast.draw(ctx);\n  // ctx.clearRect(0, 0, canvasEl.width, canvasEl.height);\n  // ast.move();\n  // ast.draw(ctx);\n  const g = new Game();\n  const gv = new GameView(g, ctx);\n  gv.start();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function MovingObject(options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n}\n\nMovingObject.prototype.draw = function draw(ctx) {\n  ctx.fillStyle = this.color;\n\n  ctx.beginPath();\n  ctx.arc(\n    this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI, false\n  );\n  ctx.fill();\n}\n\nMovingObject.prototype.move = function move() {\n  this.pos = [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];\n\n  // if (this.game.isOutOfBounds(this.pos)) {\n  //   this.pos = this.game.wrap(this.pos);\n  // }\n}\n\nMovingObject.prototype.isCollidedWith = function isCollidedWith(otherObject) {\n  \n  distance = this.distanceBetween(this.pos, otherObject.pos);\n  sumRadii = (this.radius + otherObject.radius);\n  return distance < sumRadii;\n}\n\nMovingObject.prototype.distanceBetween = function distanceBetween(pos1, pos2) {\n  // sqrt((pos1[0] - pos2[0])^2 + (pos1[1] - pos2[1])^2)\n  return Math.sqrt(Math.pow(pos1[0] - pos2[0], 2) + Math.pow(pos1[1] - pos2[1], 2));\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\n\nconst CONSTANTS = {\n  RADIUS: 15,\n  COLOR: \"#FFFFFF\"\n};\n\nfunction Ship(options) {\n  options.radius = options.radius || CONSTANTS.RADIUS;\n  options.color = options.color || CONSTANTS.COLOR;\n  options.vel = options.vel || [0, 0];\n\n  MovingObject.call(this, options);\n}\n\nUtil.inherits(Ship, MovingObject);\n\nmodule.exports = Ship;\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    childClass.prototype = Object.create(parentClass.prototype);\n    childClass.prototype.constructor = childClass;\n  },\n\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n\n  randomPos() {\n    let x = Math.random() * 800;\n    let y = Math.random() * 600;\n    return [x, y];\n  },\n\n  wrap(coordinate, max) {\n    if (coordinate > max) {\n      return coordinate % max;\n    } else if (coordinate < 0) {\n      return max;\n    } else { \n      return coordinate;\n    }\n  }\n};\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });