import 'package:code_test_app/bloc/home_indexed_stack_cubit.dart';
import 'package:code_test_app/constants/assets_constants.dart';
import 'package:code_test_app/screens/wheather_fragment/barometer_fragment.dart';
import 'package:code_test_app/screens/wheather_fragment/humidity_fragment.dart';
import 'package:code_test_app/screens/wheather_fragment/temperature_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WheatherAppTaskScreen extends StatefulWidget {
  @override
  State<WheatherAppTaskScreen> createState() => _WheatherAppTaskScreenState();
}

class _WheatherAppTaskScreenState extends State<WheatherAppTaskScreen> {
  List<Widget> pageList = [];

  @override
  void initState() {
    super.initState();
    pageList = [
      TemperatureFragment(),
      HumidityFragment(),
      BarometerFragment(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<HomeIndexedStackCubit, int>(builder: (context, state) {
        return IndexedStack(
          index: state,
          children: pageList,
        );
      }),
      bottomNavigationBar: BlocBuilder<HomeIndexedStackCubit, int>(
        builder: (context, state) {
          return SizedBox(
            height: 50,
            child: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 3,
                  offset: Offset(0, -2),
                )
              ]),
              child: BottomNavigationBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconSize: 0,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                selectedItemColor: Colors.blue,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        kIconTemperature,
                        color: state == 0 ? Colors.blue : Colors.grey,
                      ),
                    ),
                    label: "Barometer",
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        kIconHumidity,
                        color: state == 1 ? Colors.blue : Colors.grey,
                      ),
                    ),
                    label: "Humidity",
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 35,
                      height: 35,
                      padding: EdgeInsets.all(3),
                      child: SvgPicture.asset(
                        kIconBarometer,
                        color: state == 2 ? Colors.blue : Colors.grey,
                      ),
                    ),
                    label: "Barometer",
                  ),
                ],
                currentIndex: state,
                onTap: (int index) {
                  context.read<HomeIndexedStackCubit>().changePage(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
