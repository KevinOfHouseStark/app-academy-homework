Array.prototype.myEach = function (cb) {
  for (let i = 0; i < this.length; i++) {
    cb(this[i]);
  }
}

// [0, 1, 2, 3, 4, 5].myEach((num) => {
//   console.log(num);
// });

Array.prototype.myMap = function (cb) {
  let mappedArray = [];

  this.myEach(el => mappedArray.push(cb(el)) );

  return mappedArray;
};

console.log([0, 1, 2, 3, 4, 5].myMap(num => num * num))

Array.prototype.myReduce = function (cb, accumulator) {
  let arr = this;

  if (accumulator === undefined) {
    accumulator = arr[0];
    arr = arr.slice(1);
  }

  let reduced = accumulator;

  arr.myEach(el => reduced = cb(reduced, el));

  return reduced;
}

console.log([0, 1, 2, 3, 4, 5].myReduce( (total, item) => total + item));