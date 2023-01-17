int findPatternRight(String equationL,String equationR){
  var eqLenL = equationL.length;
  var eqLenR = equationR.length;
  if (eqLenR>=17 && equationR.substring(0,17)=="\\frac{\\phantom{1}"){
    return 17;
  }
  else if (eqLenR>=7 && equationR.substring(0,7)=="\\infty "){
    return 7;
  }
  else if (eqLenR>=6 && equationR.substring(0,6)=="\\int_{"){
    return 6;
  }
  else if (eqLenR>=3 && equationR.substring(0,3)=="}^{"){
    return 3;
  }
  else if (eqLenR>=2 && equationR.substring(0,2)=="^{"){
    return 2;
  }
  else if (eqLenR>=24 && equationR.substring(0,24)=="\\phantom{1}}{\\phantom{1}"){
    return 24;
  }
  else if (eqLenR>=12 && equationR.substring(0,12)=="\\phantom{1}}"){
    return 12;
  }
  else if (eqLenR>=7 && equationR.substring(0,7)=="\\lim_{{"){
    return 7;
  }
  else if (eqLenR>=5 && equationR.substring(0,5)=="}\\to{"){
    return 5;
  }
  else if (eqLenR>=4 && equationR.substring(0,4)=="\\ln "){
    return 4;
  }
  else if (eqLenR>=6 && equationR.substring(0,6)=="\\log_{"){
    return 6;
  }
  else if (eqLenR>=7 && equationR.substring(0,7)=="\\times "){
    return 7;
  }
  else if (eqLenR>=5 && equationR.substring(0,5)=="\\div "){
    return 5;
  }
  else if (eqLenR>=8 && equationR.substring(0,8)=="\\degree "){
    return 8;
  }
  else if (eqLenR>=3 && equationR.substring(0,3)=="\\% "){
    return 3;
  }
  else if (eqLenR>=4 && equationR.substring(0,4)=="\\pi "){
    return 4;
  }
  else if (eqLenR>=6 && equationR.substring(0,6)=="\\sqrt{"){
    return 6;
  }
  else if (eqLenR>=2 && equationR.substring(0,2)=="}}"){
    var leftBrakets = 0;
    var rightBrakets = 1;

    for(var counter = eqLenL; counter > 0; counter--){
      if(equationL.substring(counter - 1, counter) == "}"){
        rightBrakets++;
      }
      else if(equationL.substring(counter - 1, counter) == "{"){
        leftBrakets++;
      }
      if(leftBrakets == rightBrakets) {
        if(counter>=3 && equationL.substring(counter-3, counter) == "to{") {
          return 2;
        } else {
          return 1;
        }
      }
    }
    return 1;
  }
  else {
    return 1;
  }
}