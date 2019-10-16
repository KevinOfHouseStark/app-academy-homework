Array.prototype.uniq = function() {
  let uniqArray = [];

  for (let i = 0; i < this.length; i++) {
    if (uniqArray.indexOf(this[i]) === -1) {
      uniqArray.push(this[i]);
    }
  }

  return uniqArray;
}

// TEST CASE
console.log([1, 1, 2, 2].uniq());

Array.prototype.twoSum = function() {
  const sumPairs = [];

  for (let i = 0; i < this.length; i++) {
    for (let j = (i + 1); j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        sumPairs.push([i, j]);
      }
    }
  }

  return sumPairs;
}

console.log([4, 0, 1, -1, 3, -3, -4].twoSum())

Array.prototype.transpose = function() {
  let transposedArray = Array.from({ length: this[0].length },
    () => Array.from({length: this.length}));

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      transposedArray[j][i] = this[i][j];
    }
  }

  return transposedArray;
}

console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());