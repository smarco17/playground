function test_spread_list(){
    const numbers = [22, 33, 44, 198];
    const numbers_add = [200, 90];
    const numbers_spread = [...numbers, ...numbers_add];
    console.log(numbers);
    console.log(numbers_spread);
    console.log(numbers.concat(numbers_add));
}

function test_spread_object(){
    const obj = { a: 1, b: 2};
    const obj_add = { c: 3 };
    const obj_spread = {...obj, ...obj_add};
    console.log(obj);
    console.log(obj_spread);
}

function test_spread_dest(){
    const numbers = [123, 333, 459];
    const [x, ...rest] = numbers;
    console.log(numbers);
    console.log(x);
    console.log(rest);
}

test_spread_list();
test_spread_object();
test_spread_dest();