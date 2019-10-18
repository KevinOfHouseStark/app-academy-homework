function sum (...nums) {
  let total = 0; 
  for (i = 0; i < nums.length; i++) {
    total += nums[i];
  }
  return total; 
}

console.log(sum(1,2,3));

Function.prototype.myBind = function (context, ...bindArgs) {
  return (...callArgs) => {
    this.apply(context, bindArgs.concat(callArgs));
  }
}

Function.prototype.myBind2 = function (context) {
  const bindArgs = Array.from(arguments).slice(1);

  return () => {
    const callArgs = Array.from(arguments);
    this.apply(context, bindArgs.concat(callArgs));
  }
}

function curriedSum(numArgs) {
  const nums = [];

  function _curriedSum(num) {
    nums.push(num);

    if (nums.length === numArgs) {
      let sum = 0;

      nums.forEach((n) => { sum += n });

      return sum;
    } else {
      return _curriedSum;
    }
  }

  return _curriedSum;
}

// const total = curriedSum(4);
// console.log(total(5)(30)(20)(1)); // => 56

// Using apply
Function.prototype.curry1 = function(numArgs) {
  const args = [];
  const func = this;

  function _curriedFunc(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return func.apply(null, args);
    } else {
      return _curriedFunc;
    }
  }

  return _curriedFunc;
}

// const total = sum.curry1(4);
// console.log(total(5)(30)(20)(1)); // => 56

// Using spread operator
Function.prototype.curry2 = function(numArgs) {
  const args = [];
  const func = this;

  function _curriedFunc(arg) {
    args.push(arg);

    if (args.length === numArgs) {
      return func.call(null, ...args);
    } else {
      return _curriedFunc;
    }
  }

  return _curriedFunc;
}

// const total = sum.curry2(4);
// console.log(total(5)(30)(20)(1)); // => 56