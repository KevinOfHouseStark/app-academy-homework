class DOMNodeCollection {
  constructor(nodeList) {
    this.nodeList = nodeList;
  }

  html(innerHTML) {
    if (innerHTML) {
      this.innerHTML = innerHTML; 
    } else {
      this.innerHTML = this.nodeList[0].innerHTML; 
    }
  }

  empty() {
    this.nodeList.forEach(el => {
      el.html = "";
    });
  }

  append(child) {
    if (typeof child === "string") {
      this.nodeList.forEach(node => {
        node.text += child;
      });
    } else if (child instanceof HTMLElement) {
      this.nodeList.forEach(node => {
        node.innerHTML += child.outerHTML;
      });
    }
  }

  first() {
    return this.nodeList[0];
  }

  attr(key, value) {
    if (value) {
      this.nodeList.forEach(node => {
        node.setAttribute(key, value);
        node[key] = value; 
      });
    } else {
      return this.nodeList[0][key]; 
    }
  }

  addClass(newClass) {
    this.nodeList.forEach(node => {
      node.classList.add(newClass);
    });
  }

  removeClass(oldClass) {
  this.nodeList.forEach(node => {
      node.classList.remove(oldClass);
    });
  }

  children() {
    let childrenList = [];

    this.nodeList.forEach(node => {
      childrenList = childrenList.concat(Array.from(node.children));
    });

    return new DOMNodeCollection(childrenList);
  }

  parent() {
    let parentList = [];

    this.nodeList.forEach(node => {
      parentList = parentList.concat(Array.from(node.parentNode));
    });

    return new DOMNodeCollection(parentList);
  }

  find(selector) {
    let foundList = [];

    this.nodeList.forEach(node => {
      foundList = foundList.concat(Array.from(node.querySelectorAll(selector)));
    });

    return new DOMNodeCollection(foundList);
  }

  remove() {
    this.nodeList.forEach(node => {
      node.parentNode.removeChild(node);
    })
  }

  on(event, cb) {
    this.nodeList.forEach(node => {
      node.addEventListener(event, cb);
      if (node[`${event}`].length >= 1) {
        node[`${event}`].push(cb); 
      } else {
        node[`${event}`] = [cb];
      }
    });
  }

  off(event) {
    this.nodeList.forEach(node => {
      node[`${event}`].forEach ( cb => {
        node.removeEventListener(event, cb);
      });

      node[`${event}`] = [];
    });
  }
}

module.exports = DOMNodeCollection; 