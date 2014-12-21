function processData(input) {
    Enter your code here 
    var breaks = input.split('n');
      
    for (var i = 1; i = breaks[0]; i++) {
      var numberToExamineInStringForm = breaks[i];
      returnHowManyDigitsCanDivideItCompletely(numberToExamineInStringForm);
    }
    
} 

function returnHowManyDigitsCanDivideItCompletely(stringVersion) {
    var resultCounter = 0;
    var integerVersionEntireString = parseInt(stringVersion);
    for (var i=0; i  stringVersion.length; i++) {
        var oneDigit = stringVersion[i];
        var integerVersionOneDigit = parseInt(oneDigit);
        if (integerVersionOneDigit === 0) {
            do nothing
        }
        else if (integerVersionEntireString % integerVersionOneDigit === 0) {
            resultCounter++;
        }
     }
     console.log(resultCounter);
}

process.stdin.resume();
process.stdin.setEncoding(ascii);
_input = ;
process.stdin.on(data, function (input) {
    _input += input;
});

process.stdin.on(end, function () {
   processData(_input);
});
