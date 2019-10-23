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
/******/ 	return __webpack_require__(__webpack_require__.s = "./frontend/twitter.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports) {

const APIUtil = {
  followUser: id => {
    return $.ajax({
      method: "POST",
      dataType: "json",
      url: `/users/${id}/follow`,
      error: function () {
        console.log('Follow error!');
      }
    })
  },

  unfollowUser: id => {
     return $.ajax({
      method: "DELETE",
      dataType: "json",
      url: `/users/${id}/follow`,
      error: function () {
        console.log('Unfollow error!');
      }
    })
  },

  searchUsers: queryVal => {
    return $.ajax({
      method: "GET",
      dataType: "json",
      url: '/users/search',
      data: { queryVal }
    })
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = this.$el.data("initial-follow-state") || options.followState;

    this.render();
    this.$el.on('click', this.handleClick.bind(this));
  };

  render() {
    if (this.followState === "unfollowed") {
      this.$el.prop('disabled', false);
      this.$el.html('Follow!');
    } else if (this.followState === "followed") {
      this.$el.prop('disabled', false);
      this.$el.html('Unfollow!');
    } else if (this.followState === "following" || this.followState === "unfollowing") {
      this.$el.prop('disabled', true);
    }
  }

  handleClick(event) {
    const followToggleInstance = this;

    event.preventDefault();

    if (this.followState === "unfollowed") {
      followToggleInstance.followState = "following";
      followToggleInstance.render();
      APIUtil.followUser(this.userId).then( () => {
        followToggleInstance.followState = "followed";
        followToggleInstance.render();
      });
    } else if (this.followState === "followed") {
      followToggleInstance.followState = "unfollowing";
      followToggleInstance.render();
      APIUtil.unfollowUser(this.userId).then( () => {
        followToggleInstance.followState = "unfollowed";
        followToggleInstance.render();
      });
    }
  }
};

module.exports = FollowToggle;



/***/ }),

/***/ "./frontend/twitter.js":
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");
const UsersSearch = __webpack_require__(/*! ./users_search */ "./frontend/users_search.js");

$(function () {
  $("button.follow-toggle").each ( (idx, el) => new FollowToggle(el) );
  $("nav.users-search").each ( (idx, el) => new UsersSearch(el) );
});

/***/ }),

/***/ "./frontend/users_search.js":
/*!**********************************!*\
  !*** ./frontend/users_search.js ***!
  \**********************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

class UsersSearch {
  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find('input[name=query]');
    this.$ul = this.$el.find('.users');

    this.$input.on('input', this.handleInput.bind(this));
  }

  handleInput(event) {
    APIUtil.searchUsers(this.$input.val()).then(users => this.renderResults(users));
  }

  renderResults(users) {
    this.$ul.empty();
    users.forEach(user => {
      const $a = $(`<a>${user.username}</a>`);
      $a.attr('href', `/users/${user.id}`);

      const $button = $('<button></button>')
      new FollowToggle($button, {
        userId: user.id,
        followState: user.followed ? 'followed' : 'unfollowed'
      })

      const $li = $('<li></li>');
      $li.append($a);
      $li.append($button);
      this.$ul.append($li);
    })
  }
};

module.exports = UsersSearch;

/***/ })

/******/ });
//# sourceMappingURL=bundle.js.map