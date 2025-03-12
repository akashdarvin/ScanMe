import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../domain/ocr.dart';
import '../domain/ocr_entity.dart';

part 'ocr_event.dart';
part 'ocr_state.dart';

class OcrBloc extends Bloc<OcrEvent, OcrState> {
  final GetUserDataFromImage getUserDataFromImage;
  OcrBloc(this.getUserDataFromImage) : super(UserInitialState()) {
    on<GetUserDataEvent>((event, emit)async {
      emit(UserLoadingState());
      final result = await getUserDataFromImage.execute(event.imageFile);
       result.fold(
        (failure) {
          emit(UserErrorState(failure));
        },
        (user) {
          emit(UserLoadedState(user));
        },
      );
    });
  }
}
