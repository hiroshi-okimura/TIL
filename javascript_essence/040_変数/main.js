const a = {
  prop: 0
}

let { prop } = a;

prop = 1;

console.log(a, prop);
