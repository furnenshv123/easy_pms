part of 'staff_bloc.dart';

sealed class StaffEvent extends Equatable {
  const StaffEvent();

  @override
  List<Object> get props => [];
}


class GetStaffEvent extends StaffEvent{}

class AddTaskStaffEvent extends StaffEvent{
  final String task;
  final String name;
  final String type;
  const AddTaskStaffEvent({required this.type, required this.name, required this.task});
  @override
  // TODO: implement props
  List<Object> get props => [task];
}