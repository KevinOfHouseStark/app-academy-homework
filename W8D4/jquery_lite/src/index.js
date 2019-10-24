const DOMNodeCollection = require('./dom_node_collection');
let _callbacksOnReady = [];
let _documentReady = false;


function $l(arg) {
  if (typeof(arg) === "string") {
    let nodeList = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(nodeList));
  } else if (arg instanceof HTMLElement) {
    let collection = new DOMNodeCollection([arg]); 
    return collection;
  } else if (typeof(arg) === "function") {
      if (_documentReady) {
        arg();
      } else {
      _callbacksOnReady.push(arg);
      }
  }
}

$l.extend = function (firstObj, ...otherObjs) {
  otherObjs.forEach(obj => {
    for (let property in obj) {
      firstObj[property] = obj[property];
    }
  });
  return firstObj;
}

$l.ajax = function (options) {
  const xhr = new XMLHttpRequest();

  const defaults = {
    method: "GET",
    url: "",
    success: () => {},
    error: () => {console.log('ERROR!')},
    data: {},
    dataType: "json"
  };

  options = $l.extend(defaults, options);

  xhr.open(options.method, options.url);
  xhr.onload = function () {
    console.log(xhr.status);
    console.log(xhr.responseType);
    console.log(xhr.response);
  }

  xhr.send(options.data);
}

document.addEventListener("DOMContentLoaded", () => {
  _documentReady = true;
  _callbacksOnReady.forEach (cb => {
      cb();
  });
});


window.$l = $l
//elementList = parentNode.querySelectorAll(selectors);