import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/features/electronic_keys/presentation/bloc/bloc/keys_bloc.dart';
import 'package:easy_pms/features/electronic_keys/presentation/widgets/electronic_key_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ElectronicKeysScreen extends StatefulWidget {
  const ElectronicKeysScreen({super.key});

  @override
  State<ElectronicKeysScreen> createState() => _ElectronicKeysScreenState();
}

class _ElectronicKeysScreenState extends State<ElectronicKeysScreen> {
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView.builder(
                itemCount: state.models.length,
                itemBuilder: (context, index) {
                  return ElectronicKeyWidget(
                    name: state.models[index].name,
                    isActive: state.models[index].isActive!,
                    roomNumber: state.models[index].roomNumber,
                  );
                },
              ),
            );
          }
          if (state is KeysFailure) {
            return const Center(
              child: Text('Ошибка'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
