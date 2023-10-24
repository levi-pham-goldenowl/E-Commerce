import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paginate_state.dart';

abstract class PaginateBloc<T extends PaginateState> extends Cubit<T> {
  PaginateBloc(T initialState) : super(initialState);

  Future<void> fetchFirstData();

  Future<void> fetchNextData();
}
