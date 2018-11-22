function mysteryScoping1() {
  var x = 'out of block';
  if (true) {
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping2() {
  const x = 'out of block';
  if (true) {
    const x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping3() {
  const x = 'out of block';
  if (true) {
    // error trying to overwrite constant
    var x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping4() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  console.log(x);
}

function mysteryScoping5() {
  let x = 'out of block';
  if (true) {
    let x = 'in block';
    console.log(x);
  }
  let x = 'out of block again';
  console.log(x);
}

function madLib(verb, adjective, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}`)
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString)
}

function fizzBuzz(array) {
  newArray = [];

  for (i = 0; i < array.length; i++) {
    let n = array[i]

    if (n % 15 === 0) {
      newArray.push('fizzbuzz')
    } else if (n % 3 === 0) {
      newArray.push('fizz')
    } else if (n % 5 === 0) {
      newArray.push('buzz')
    } else {
      newArray.push(n)
    }
  }

  return newArray
}

function isPrime(num) {
  if (num <= 1) {
    return false
  }

  for (i = 2; i < num; i++) {
    if (num % i == 0) {
      return false
    }
  }

  return true
}

function sumOfNPrimes(n) {
  let sum = 0;
  let nth_prime = 0;

  let i = 0;
  while (nth_prime < n) {
    if (isPrime(i)) {
      sum += i;
      nth_prime++;
    }
    i++;
  }

  return sum
}
