function range(start, end) {
  if (start === end) {
    return [];
  }

  let arr = range(start, end - 1);
  arr.push(end - 1);
  return arr;
}

console.log(range(0, 10));

function sumRec(arr) {
  if (arr.length === 0) {
    return 0;
  }

  return sumRec(arr.slice(0, arr.length - 1)) + arr[arr.length - 1];
}

console.log(sumRec([200, 100, 50]));

function exponent(base, exp) {
  if (exp === 0) {
    return 1;
  }

  return base * exponent(base, exp - 1);
}

console.log(exponent(2, 3));

function fibonacci(n) {
  if (n < 3) {
    return [0, 1].slice(0, n);

    let fibArr = fibonacci(n - 1);
    fibArr.push(fibArr[fibArr.length - 1] + fibArr[fibArr.length - 2]);

    return fibArr;
  }
}

console.log(fibonacci(10));