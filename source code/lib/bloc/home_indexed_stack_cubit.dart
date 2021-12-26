import 'package:flutter_bloc/flutter_bloc.dart';

class HomeIndexedStackCubit extends Cubit<int> {
  HomeIndexedStackCubit() : super(0);

  void changePage(int _index){
    emit(_index);
  }
}