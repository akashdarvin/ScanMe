part of 'ocr_bloc.dart';

sealed class OcrState extends Equatable {
  const OcrState();
  
  @override
  List<Object> get props => [];
}

class UserInitialState extends OcrState {}

class UserLoadingState extends OcrState {}

class UserLoadedState extends OcrState {
  final User user;

  const UserLoadedState(this.user);

  @override
  List<Object> get props => [user];
}

class UserErrorState extends OcrState {
  final String error;

  const UserErrorState(this.error);

  @override
  List<Object> get props => [error];
}