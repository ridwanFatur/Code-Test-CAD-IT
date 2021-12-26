import 'dart:math';

class SequenceNumberFunction {
  static int processSequenceNumber(num input) {
    int section = 1;
    num accumulateValue = 0;
    num thresholdValue = (9 * pow(10, section - 1) * section);
    while (input > thresholdValue) {
      accumulateValue += (9 * pow(10, section - 1) * section);
      section += 1;
      thresholdValue += (9 * pow(10, section - 1) * section);
    }
    num lowerValue = pow(10, section - 1) - 1;
    num componentValue = input - accumulateValue;

    num dividerResult = componentValue ~/ section;
    num modularResult = componentValue % section;
    num numberValue = lowerValue + dividerResult;

    int indexDigit =
        modularResult.toInt() == 0 ? section - 1 : modularResult.toInt() - 1;
    var digitOutput = numberValue.toString()[indexDigit];
    int intDigitOut = int.parse(digitOutput.toString());

    return intDigitOut;
  }

 
}
