function test_map(){
    const numbers = [1, 2, 3, 4, 5];
    let result = numbers.map((value) => { return value*2; });
    console.log(result);
}

function test_map_ref(){
    const fruits = {
        'apple': 450,
        'orange': 80,
        'lemon': 200,
        'melon': 2000
    };
    const order = ['apple'];
    let result = order.map((value, index, array) => {
        return this[value];
    }, fruits);
    console.log(result);
}

function test_forEach(){
    let numbers = [1, 2, 3, 4, 5];
    numbers.forEach((value) => { console.log(value); });
}

function test_filter(){
    const numbers = [2, 34, 3, 9, 6, 88, 49];
    let result = numbers.filter((value, index, array) => {
        return value > 10;
    });
    console.log(result);
}

test_map();
test_map_ref();
test_map_nest();
test_forEach();
test_filter();