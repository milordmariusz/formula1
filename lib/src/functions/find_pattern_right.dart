int findPatternRight(String equation){
  var eqLen = equation.length;
  if (eqLen>=17 && equation.substring(0,17)=="\\frac{\\phantom{1}"){
    return 17;
  }
  else if (eqLen>=6 && equation.substring(0,6)=="\\infty"){
    return 6;
  }
  else if (eqLen>=6 && equation.substring(0,6)=="\\int_{"){
    return 6;
  }
  else if (eqLen>=3 && equation.substring(0,3)=="}^{"){
    return 3;
  }
  else if (eqLen>=2 && equation.substring(0,2)=="^{"){
    return 2;
  }
  else if (eqLen>=24 && equation.substring(0,24)=="\\phantom{1}}{\\phantom{1}"){
    return 24;
  }
  else if (eqLen>=12 && equation.substring(0,12)=="\\phantom{1}}"){
    return 12;
  }
  else if (eqLen>=7 && equation.substring(0,7)=="\\lim_{{"){
    return 7;
  }
  else if (eqLen>=5 && equation.substring(0,5)=="}\\to{"){
    return 5;
  }
  else if (eqLen>=3 && equation.substring(0,3)=="\\ln"){
    return 3;
  }
  else if (eqLen>=6 && equation.substring(0,6)=="\\log_{"){
    return 6;
  }
  else if (eqLen>=6 && equation.substring(0,6)=="\\times"){
    return 6;
  }
  else if (eqLen>=4 && equation.substring(0,4)=="\\div"){
    return 4;
  }
  else if (eqLen>=7 && equation.substring(0,7)=="\\degree"){
    return 7;
  }
  else if (eqLen>=2 && equation.substring(0,2)=="\\%"){
    return 2;
  }
  else if (eqLen>=3 && equation.substring(0,3)=="\\pi"){
    return 3;
  }
  else if (eqLen>=6 && equation.substring(0,6)=="\\sqrt{"){
    return 6;
  }
  else {
    return 1;
  }
}