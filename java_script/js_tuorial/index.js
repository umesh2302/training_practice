var a = 3
const pi = 3.14
//pi = 4
//a = 'firstline\n\t\\secondline\nthirdline'
globalThis
function sum (x,y) {
    
    return x+y;
}
var ans = "" ;
var x = -9 ;
switch (x) {
    case -4 : ans = "-4";
    break;
    case -3 : ans = "-3";
    break;
    default :
    ans = "not a correct "
    //ans = 'outside'

}
let listArray = [2, -3,4.2, 4, -6, 2.8];
const squareList = (arr) => {
    const squareInt = arr.filter(num => Number.isInteger(num)).map(x => x*x);
    return squareInt
}

console.log(squareList(listArray));
