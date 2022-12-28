int findPatternLeft(String equation){
  var eqLen = equation.length;
  if (eqLen>=17 && equation.substring(eqLen-17,eqLen)=="\\frac{\\phantom{1}"){
    return 17;
  }
  else if (eqLen>=6 && equation.substring(eqLen-6,eqLen)=="\\infty"){
    return 6;
  }
  else if (eqLen>=6 && equation.substring(eqLen-6,eqLen)=="\\int_{"){
    return 6;
  }
  else if (eqLen>=3 && equation.substring(eqLen-3,eqLen)=="}^{"){
    return 3;
  }
  else if (eqLen>=2 && equation.substring(eqLen-2,eqLen)=="^{"){
    return 2;
  }
  else if (eqLen>=24 && equation.substring(eqLen-24,eqLen)=="\\phantom{1}}{\\phantom{1}"){
    return 24;
  }
  else if (eqLen>=12 && equation.substring(eqLen-12,eqLen)=="\\phantom{1}}"){
    return 12;
  }
  else if (eqLen>=12 && equation.substring(eqLen-12,eqLen)=="{\\phantom{1}"){
    return 12;
  }
  else if (eqLen>=2 && equation.substring(eqLen-2,eqLen)=="}{"){
    return 2;
  }
  else if (eqLen>=2 && equation.substring(eqLen-2,eqLen)=="}}"){
    return 2;
  }
  else if (eqLen>=7 && equation.substring(eqLen-7,eqLen)=="\\lim_{{"){
    return 7;
  }
  else if (eqLen>=5 && equation.substring(eqLen-5,eqLen)=="}\\to{"){
    return 5;
  }
  else if (eqLen>=3 && equation.substring(eqLen-3,eqLen)=="\\ln"){
    return 3;
  }
  else if (eqLen>=6 && equation.substring(eqLen-6,eqLen)=="\\log_{"){
    return 6;
  }
  else if (eqLen>=6 && equation.substring(eqLen-6,eqLen)=="\\times"){
    return 6;
  }
  else if (eqLen>=4 && equation.substring(eqLen-4,eqLen)=="\\div"){
    return 4;
  }
  else if (eqLen>=7 && equation.substring(eqLen-7,eqLen)=="\\degree"){
    return 7;
  }
  else if (eqLen>=2 && equation.substring(eqLen-2,eqLen)=="\\%"){
    return 2;
  }
  else if (eqLen>=3 && equation.substring(eqLen-3,eqLen)=="\\pi"){
    return 3;
  }
  else if (eqLen>=6 && equation.substring(eqLen-6,eqLen)=="\\sqrt{"){
    return 6;
  }
  else {
    return 1;
  }
}