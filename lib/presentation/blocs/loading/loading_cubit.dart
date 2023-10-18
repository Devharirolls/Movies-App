import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class LoadingCubit extends Cubit<bool> {
  LoadingCubit() : super(false);

  void show() => emit(true);

  void hide() => emit(false);
}
