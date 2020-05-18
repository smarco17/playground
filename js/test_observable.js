const Rx = require('rxjs');

function test_create(){
    const obs = Rx.Observable.create(o => {
        o.next(10);
        o.next(20);
        o.next(30);
        o.complete('finish');
    });
    obs.subscribe(res => console.log(res));
}

function test_of(){
    Rx.of(1, 2, 3).subscribe((x) => {
        console.log(x);
    });
}

test_create();
test_of();