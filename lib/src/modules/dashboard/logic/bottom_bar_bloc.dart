import 'package:e_commerce/src/constants/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_bar_state.dart';

class BottomBarBloc extends Cubit<BottomBarState> {
  BottomBarBloc() : super(const BottomBarState());

  void onItemTapped(int index) {
    emit(state.copyWith(index: PageIndex.values[index]));
  }
}
