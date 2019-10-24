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

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n  constructor(nodeList) {\n    this.nodeList = nodeList;\n  }\n\n  html(innerHTML) {\n    if (innerHTML) {\n      this.innerHTML = innerHTML; \n    } else {\n      this.innerHTML = this.nodeList[0].innerHTML; \n    }\n  }\n\n  empty() {\n    this.nodeList.forEach(el => {\n      el.html = \"\";\n    });\n  }\n\n  append(child) {\n    if (typeof child === \"string\") {\n      this.nodeList.forEach(node => {\n        node.text += child;\n      });\n    } else if (child instanceof HTMLElement) {\n      this.nodeList.forEach(node => {\n        node.innerHTML += child.outerHTML;\n      });\n    }\n  }\n\n  first() {\n    return this.nodeList[0];\n  }\n\n  attr(key, value) {\n    if (value) {\n      this.nodeList.forEach(node => {\n        node.setAttribute(key, value);\n        node[key] = value; \n      });\n    } else {\n      return this.nodeList[0][key]; \n    }\n  }\n\n  addClass(newClass) {\n    this.nodeList.forEach(node => {\n      node.classList.add(newClass);\n    });\n  }\n\n  removeClass(oldClass) {\n  this.nodeList.forEach(node => {\n      node.classList.remove(oldClass);\n    });\n  }\n\n  children() {\n    let childrenList = [];\n\n    this.nodeList.forEach(node => {\n      childrenList = childrenList.concat(Array.from(node.children));\n    });\n\n    return new DOMNodeCollection(childrenList);\n  }\n\n  parent() {\n    let parentList = [];\n\n    this.nodeList.forEach(node => {\n      parentList = parentList.concat(Array.from(node.parentNode));\n    });\n\n    return new DOMNodeCollection(parentList);\n  }\n\n  find(selector) {\n    let foundList = [];\n\n    this.nodeList.forEach(node => {\n      foundList = foundList.concat(Array.from(node.querySelectorAll(selector)));\n    });\n\n    return new DOMNodeCollection(foundList);\n  }\n\n  remove() {\n    this.nodeList.forEach(node => {\n      node.parentNode.removeChild(node);\n    })\n  }\n\n  on(event, cb) {\n    this.nodeList.forEach(node => {\n      node.addEventListener(event, cb);\n      if (node[`${event}`].length >= 1) {\n        node[`${event}`].push(cb); \n      } else {\n        node[`${event}`] = [cb];\n      }\n    });\n  }\n\n  off(event) {\n    this.nodeList.forEach(node => {\n      node[`${event}`].forEach ( cb => {\n        node.removeEventListener(event, cb);\n      });\n\n      node[`${event}`] = [];\n    });\n  }\n}\n\nmodule.exports = DOMNodeCollection; \n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DOMNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\nlet _callbacksOnReady = [];\nlet _documentReady = false;\n\n\nfunction $l(arg) {\n  if (typeof(arg) === \"string\") {\n    let nodeList = document.querySelectorAll(arg);\n    return new DOMNodeCollection(Array.from(nodeList));\n  } else if (arg instanceof HTMLElement) {\n    let collection = new DOMNodeCollection([arg]); \n    return collection;\n  } else if (typeof(arg) === \"function\") {\n      if (_documentReady) {\n        arg();\n      } else {\n      _callbacksOnReady.push(arg);\n      }\n  }\n}\n\n$l.extend = function (firstObj, ...otherObjs) {\n  otherObjs.forEach(obj => {\n    for (let property in obj) {\n      firstObj[property] = obj[property];\n    }\n  });\n  return firstObj;\n}\n\n$l.ajax = function (options) {\n  const xhr = new XMLHttpRequest();\n\n  const defaults = {\n    method: \"GET\",\n    url: \"\",\n    success: () => {},\n    error: () => {console.log('ERROR!')},\n    data: {},\n    dataType: \"json\"\n  };\n\n  options = $l.extend(defaults, options);\n\n  xhr.open(options.method, options.url);\n  xhr.onload = function () {\n    console.log(xhr.status);\n    console.log(xhr.responseType);\n    console.log(xhr.response);\n  }\n\n  xhr.send(options.data);\n}\n\ndocument.addEventListener(\"DOMContentLoaded\", () => {\n  _documentReady = true;\n  _callbacksOnReady.forEach (cb => {\n      cb();\n  });\n});\n\n\nwindow.$l = $l\n//elementList = parentNode.querySelectorAll(selectors);\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });