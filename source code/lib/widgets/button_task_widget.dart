import 'package:flutter/material.dart';

class ButtonTaskWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPress;
  final Widget? extendedWidget;
  ButtonTaskWidget({
    required this.title,
    required this.description,
    required this.onPress,
    this.extendedWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        child: InkWell(
          onTap: () {
            onPress();
          },
          splashFactory: InkRipple.splashFactory,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.android,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...extendedView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> extendedView() {
    if (extendedWidget != null) {
      return [
        SizedBox(height: 15),
        extendedWidget!,
      ];
    } else {
      return [];
    }
  }
}
