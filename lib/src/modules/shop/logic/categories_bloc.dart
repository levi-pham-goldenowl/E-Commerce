import 'package:e_commerce/src/models/categories_model.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "categories_state.dart";

class CategoriesBloc extends Cubit<CategoriesState> {
  CategoriesBloc() : super(CategoriesState(items: XHandle.completed([]))) {
    getCategory();
  }
  final Domain domain = Domain();

  Future<void> getCategory() async {
    final category = await domain.category.fetchCategory();

    emit(state.copyWith(items: XHandle.completed(category.data ?? [])));
  }

  Future<void> addCategory() async {
    final category = await domain.category.addCategory();

    emit(state.copyWith(items: XHandle.completed(category.data ?? [])));
  }
}
