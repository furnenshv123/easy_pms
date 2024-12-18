part of 'staff_bloc.dart';

sealed class StaffState extends Equatable {
  const StaffState();
  
  @override
  List<Object> get props => [];
}

final class StaffInitial extends StaffState {}


class StaffLoading extends StaffState{}

class StaffLoaded extends StaffState{
  final List<StaffModel> models;

  const StaffLoaded({required this.models});
  @override
  // TODO: implement props
  List<Object> get props => [models];
}

class StaffFailure extends StaffState{}