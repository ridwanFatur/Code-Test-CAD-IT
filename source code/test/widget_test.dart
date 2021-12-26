import 'package:code_test_app/helpers/sequence_number_function.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Sequence Number Function", () {
    int? input;
    input = SequenceNumberFunction.processSequenceNumber(5);
    expect(input, 5);
    input = SequenceNumberFunction.processSequenceNumber(15);
    expect(input, 2);
    input = SequenceNumberFunction.processSequenceNumber(21);
    expect(input, 5);
  });
}
