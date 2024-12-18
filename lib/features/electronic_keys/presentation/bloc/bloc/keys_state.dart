part of 'keys_bloc.dart';

sealed class KeysState extends Equatable {
  const KeysState();

  @override
  List<Object> get props => [];
}

final class KeysInitial extends KeysState {}

class KeysLoading extends KeysState {}

class KeysFailure extends KeysState {}

class KeysLoaded extends KeysState {
  final List<ElectronicKeyModel> models;

  const KeysLoaded({required this.models});
  @override
  // TODO: implement props
  List<Object> get props => [models];
}
