import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/features/electronic_keys/presentation/bloc/bloc/keys_bloc.dart';
import 'package:easy_pms/features/room_accounting/presentation/widgets/room_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class RoomAccountingScreen extends StatefulWidget {
  const RoomAccountingScreen({super.key});

  @override
  State<RoomAccountingScreen> createState() => _RoomAccountingScreenState();
}

class _RoomAccountingScreenState extends State<RoomAccountingScreen> {
  Map<int, int> rooms = {
    101: 1,
    102: 2,
    103: 2,
    104: 2,
    105: 2,
    106: 2,
    201: 4,
    202: 4,
    203: 4,
    204: 1,
    205: 1,
    206: 1
  };
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KeysBloc()..add(GetElectronicKeysEvent()),
      child: BlocConsumer<KeysBloc, KeysState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is KeysLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is KeysLoaded) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: rooms.length,
                itemBuilder: (context, index) {
                  return RoomWidget(
                      roomNumber: rooms.keys.toList()[index],
                      countOfPerson: rooms.values.toList()[index],
                      isbusy: state.models[index].isActive!);
                },
              ),
            );
          }
          if(state is KeysFailure){
            return const Center(child:  Text('Ошибка'),);
          }
          return Container();
        },
      ),
    );
  }
}
