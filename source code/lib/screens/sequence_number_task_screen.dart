import 'package:code_test_app/helpers/sequence_number_function.dart';
import 'package:code_test_app/helpers/show_toast.dart';
import 'package:code_test_app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SequenceNumberTaskScreen extends StatefulWidget {
  @override
  State<SequenceNumberTaskScreen> createState() =>
      _SequenceNumberTaskScreenState();
}

class _SequenceNumberTaskScreenState extends State<SequenceNumberTaskScreen> {
  TextEditingController controller = TextEditingController();
  String? output;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sequence Number Task"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldWidget(
                controller: controller,
                hintText: "Your Input",
                textInputType: TextInputType.number,
              ),
              output != null
                  ? Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Output: ${output!}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    String input = controller.text;
                    if (input.isEmpty) {
                      showToast("Input Cannot be empty");
                    } else {
                      try {
                        int intInput = int.parse(input);
                        if (intInput > 0) {
                          int myOutput =
                              SequenceNumberFunction.processSequenceNumber(intInput);
                          setState(() {
                            output = myOutput.toString();
                          });
                        } else {
                          controller.text = "";
                          showToast("Input must be greater than 0");
                        }
                      } catch (e) {
                        controller.text = "";
                        showToast("Input must be a number");
                      }
                    }
                  },
                  child: Text("Process"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  

}
