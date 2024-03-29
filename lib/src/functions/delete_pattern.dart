List<int> deletePattern(String equationLeft, String equationRight) {
  var eqLenLeft = equationLeft.length;
  var eqLenRight = equationRight.length;
  if (eqLenLeft >= 4 &&
      equationLeft.substring(eqLenLeft - 4, eqLenLeft) == "\\pi ") {
    return [4, 0];
  } else if (eqLenLeft >= 3 &&
      equationLeft.substring(eqLenLeft - 3, eqLenLeft) == "\\% ") {
    return [3, 0];
  } else if (eqLenLeft >= 8 &&
      equationLeft.substring(eqLenLeft - 8, eqLenLeft) == "\\degree ") {
    return [8, 0];
  } else if (eqLenLeft >= 7 &&
      equationLeft.substring(eqLenLeft - 7, eqLenLeft) == "\\infty ") {
    return [7, 0];
  } else if (eqLenLeft >= 7 &&
      equationLeft.substring(eqLenLeft - 7, eqLenLeft) == "\\times ") {
    return [7, 0];
  } else if (eqLenLeft >= 5 &&
      equationLeft.substring(eqLenLeft - 5, eqLenLeft) == "\\div ") {
    return [5, 0];
  } else if (eqLenLeft >= 4 &&
      equationLeft.substring(eqLenLeft - 4, eqLenLeft) == "\\ln ") {
    return [4, 0];
  } else if (eqLenLeft >= 8 &&
      equationLeft.substring(eqLenLeft - 8, eqLenLeft) == "\\sqrt{}") {
    return [8, 0];
  } else if (eqLenLeft >= 6 &&
      equationLeft.substring(eqLenLeft - 6, eqLenLeft) == "\\sqrt{" &&
      equationRight.substring(0, 1) == "}") {
    return [6, 1];
  } else if (eqLenLeft >= 7 &&
      equationLeft.substring(eqLenLeft - 7, eqLenLeft) == "\\log_{}") {
    return [7, 0];
  } else if (eqLenLeft >= 6 &&
      equationLeft.substring(eqLenLeft - 6, eqLenLeft) == "\\log_{" &&
      equationRight.substring(0, 1) == "}") {
    return [6, 1];
  } else if (eqLenLeft >= 6 &&
      equationLeft.substring(eqLenLeft - 6, eqLenLeft) == "\\int_{" &&
      equationRight.substring(0, 4) == "}^{}") {
    return [6, 4];
  } else if (eqLenLeft >= 10 &&
      equationLeft.substring(eqLenLeft - 10, eqLenLeft) == "\\int_{}^{}") {
    return [10, 0];
  } else if (eqLenRight >= 10 &&
      equationRight.substring(0, 10) == "\\int_{}^{}") {
    return [0, 10];
  } else if (eqLenLeft >= 7 &&
      equationLeft.substring(eqLenLeft - 7, eqLenLeft) == "\\lim_{{" &&
      equationRight.substring(0, 7) == "}\\to{}}") {
    return [7, 7];
  } else if (eqLenRight >= 14 &&
      equationRight.substring(0, 14) == "\\lim_{{}\\to{}}") {
    return [0, 14];
  } else if (eqLenLeft >= 6 &&
      equationLeft.substring(eqLenLeft - 6, eqLenLeft) == "\\lim_{" &&
      equationRight.substring(0, 1) == "}") {
    return [6, 1];
  } else if (eqLenLeft >= 17 &&
      equationLeft.substring(eqLenLeft - 17, eqLenLeft) ==
          "\\frac{\\phantom{1}" &&
      equationRight.substring(0, 36) ==
          "\\phantom{1}}{\\phantom{1}\\phantom{1}}") {
    return [17, 36];
  } else if (eqLenRight >= 53 &&
      equationRight.substring(0, 53) ==
          "\\frac{\\phantom{1}\\phantom{1}}{\\phantom{1}\\phantom{1}}") {
    return [0, 53];
  } else if (eqLenLeft >= 3 &&
      equationLeft.substring(eqLenLeft - 3, eqLenLeft) == "^{}") {
    if(eqLenLeft >= 3 &&
        equationLeft.substring(eqLenLeft - 4, eqLenLeft - 3) == "}") {
      var leftBrakets = 0;
      var rightBrakets = 0;
      for (var counter = eqLenLeft - 3; counter > 0; counter--) {
        if (equationLeft.substring(counter - 1, counter) == "}") {
          rightBrakets++;
        }
        else if (equationLeft.substring(counter - 1, counter) == "{") {
          leftBrakets++;
        }
        if (leftBrakets == rightBrakets) {
          if (counter >= 5 &&
              equationLeft.substring(counter - 5, counter) == "int_{") {
            return [0, 0];

          } else {
            return [3, 0];
          }
        }
      }
      return [3, 0];
    }
    return [3, 0];
  } else if (eqLenLeft >= 2 &&
      equationLeft.substring(eqLenLeft - 2, eqLenLeft) == "^{" &&
      equationRight.substring(0, 1) == "}") {
    if(eqLenLeft >= 3 &&
        equationLeft.substring(eqLenLeft - 3, eqLenLeft - 2) == "}") {
      var leftBrakets = 0;
      var rightBrakets = 0;
      for (var counter = eqLenLeft - 2; counter > 0; counter--) {
        if (equationLeft.substring(counter - 1, counter) == "}") {
          rightBrakets++;
        }
        else if (equationLeft.substring(counter - 1, counter) == "{") {
          leftBrakets++;
        }
        if (leftBrakets == rightBrakets) {
          if (counter >= 5 &&
              equationLeft.substring(counter - 5, counter) == "int_{") {
            return [0, 0];
          } else {
            return [2, 1];
          }
        }
      }
      return [2, 1];
    }
      return [2, 1];
  } else if (eqLenLeft >= 1 &&
      (equationLeft.substring(eqLenLeft - 1, eqLenLeft) == "}" ||
          equationLeft.substring(eqLenLeft - 1, eqLenLeft) == "{")) {
    return [0, 0];
  } else {
    return [1, 0];
  }
}
