Array.prototype.bubbleSort = function () {
  let sorted = false;

  while (!sorted) {
    sorted = true;

    for (let i = 0; i < (this.length - 1); i++) {
      if (this[i] > this[i + 1]) {
        [this[i], this[i + 1]] = [this[i + 1], this[i]];
        sorted = false;
      }
    }
  }

  return this;
}

console.log([3, 2, 1].bubbleSort());

String.prototype.substrings = function () {
  let substrings = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = i + 1; j < this.length; j++) {
      substrings.push(this.slice(i, j));
    }
  }

  return substrings;
}

console.log("kevin".substrings());