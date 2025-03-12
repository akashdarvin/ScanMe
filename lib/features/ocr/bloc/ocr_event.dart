part of 'ocr_bloc.dart';

sealed class OcrEvent extends Equatable {
  const OcrEvent();

  @override
  List<Object> get props => [];
}

class GetUserDataEvent extends OcrEvent {
  final File imageFile;

  const GetUserDataEvent(this.imageFile);

  @override
  List<Object> get props => [imageFile];
}