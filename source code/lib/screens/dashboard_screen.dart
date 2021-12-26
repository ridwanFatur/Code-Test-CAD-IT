import 'package:code_test_app/bloc/home_indexed_stack_cubit.dart';
import 'package:code_test_app/constants/url_constants.dart';
import 'package:code_test_app/screens/sequence_number_task_screen.dart';
import 'package:code_test_app/screens/wheather_app_task_screen.dart';
import 'package:code_test_app/widgets/button_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              ButtonTaskWidget(
                title: "Task - 1",
                description: "Sequence Number Program",
                onPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SequenceNumberTaskScreen();
                  }));
                },
                extendedWidget: Material(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  color: Colors.green,
                  child: InkWell(
                    splashFactory: InkRipple.splashFactory,
                    onTap: () async {
                      String url = kLinkFlowChartSequenceNumber;
                      if (await canLaunch(url)) {
                        await launch(url);
                      }
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.link,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              "Link - Flowchart",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ButtonTaskWidget(
                title: "Task - 2",
                description: "Wheather Application",
                onPress: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MultiBlocProvider(
                      providers: [
                        BlocProvider<HomeIndexedStackCubit>(create: (context) {
                          return HomeIndexedStackCubit();
                        }),
                      ],
                      child: WheatherAppTaskScreen(),
                    );
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
