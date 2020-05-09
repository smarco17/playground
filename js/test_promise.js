function purchase(yen) {
    return new Promise(function(resolve, reject){
        setTimeout(function(){
            if(yen >= 100){
                console.log('100円の商品を購入しました');
                resolve(yen - 100);
            } else {
                reject('お金が足りません');
            }
        }, 3000);
    });
}

console.log('1st. start.');
purchase(300)
  .then((change) => console.log(`1st. お釣りは${change}円です`)) // 引数(change)にはresolveの引数(yen-100)が代入される
  .catch((error) => console.log(`1st. ${error}`));                    // 引数(error)にはrejectの引数('お金が足りません')が代入される
console.log('1st. end');