const Rx = require('rxjs');

Rx.of(1, 2, 3).subscribe((x) => {
    console.log(x);
});
