import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/features/staff/presentation/bloc/bloc/staff_bloc.dart';
import 'package:easy_pms/features/staff/presentation/widgets/staff_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class StaffScreen extends StatefulWidget {
  const StaffScreen({super.key});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaffBloc()..add(GetStaffEvent()),
      child: BlocConsumer<StaffBloc, StaffState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is StaffLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is StaffLoaded) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                  itemCount: state.models.length,
                  itemBuilder: (context, index) {
                    return StaffWidget(
                      showDialog: () {
                        _showDialog(context, state.models[index].name,
                            state.models[index].type);
                      },
                      name:
                          '${state.models[index].name} ${state.models[index].lastname}',
                      type: state.models[index].type,
                      task: state.models[index].task,
                    );
                  }),
            );
          }
          if (state is StaffFailure) {
            return const Center(
              child: Text('Ошибка'),
            );
          }
          return Container();
        },
      ),
    );
  }

  void _showDialog(BuildContext buildContext, String? name, String? type) {
    TextEditingController taskController = TextEditingController();
    showDialog(
        context: buildContext,
        builder: (context) {
          return BlocProvider.value(
            value: buildContext.read<StaffBloc>(),
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
              title: const Text('Enter the task',
                  style: TextStyle(
                      color: Colors.black, fontFamily: "Hanken", fontSize: 22)),
              content: TextField(
                autofocus: true,
                decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        borderSide: BorderSide(width: 3))),
                controller: taskController,
                obscureText: false,
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancel',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Hanken",
                            fontSize: 15))),
                TextButton(
                    onPressed: () {
                      buildContext.read<StaffBloc>().add(AddTaskStaffEvent(
                          type: type ?? '',
                          name: name ?? '',
                          task: taskController.text));
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor),
                      child: const Text(
                        'Accept',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Hanken",
                            fontSize: 15),
                      ),
                    )),
              ],
            ),
          );
        });
  }
}
