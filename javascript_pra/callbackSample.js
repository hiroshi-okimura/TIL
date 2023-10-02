function add1(v1, v2) {
    return v1 + v2;
}

function calculate(v1, v2, callback) {
    return callback(v1, v2);
}

const result1 = calculate(1, 2, add1);
console.log(result1);