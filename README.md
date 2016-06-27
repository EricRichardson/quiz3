# Quiz 3

This is the third quiz for CodeCore's 2016 May Cohort.


BONUS

var filter = function (arr, filt){
  filtArr = [];

  for(var i = 0; i < arr.length; i++){
    if(filt(arr[i])){
      filtArr.push(arr[i])
    };
  };
  return filtArr;
}

var isEven = function (x) { return x % 2 == 0; };
console.log(filter([1, 2, 3, 4], isEven)); // => [2, 4]
