import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/config/locator/locator.dart';
import 'package:easy_pms/config/logger/logger.dart';
import 'package:easy_pms/features/log_in/presentation/widgets/text_field_widget.dart';
import 'package:easy_pms/features/reservation/data/models/guest_req_model.dart';
import 'package:easy_pms/features/reservation/domain/usecases/add_guest_usecase.dart';
import 'package:easy_pms/features/reservation/presentation/bloc/bloc/reservation_bloc.dart';
import 'package:easy_pms/features/reservation/presentation/widgets/dropdown_menu.dart';
import 'package:easy_pms/features/reservation/presentation/widgets/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

@RoutePage()
class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  String? tariff;
  String? service;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReservationBloc()..add(GetGuestsEvent()),
      child: BlocConsumer<ReservationBloc, ReservationState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is ReservationAddFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message ?? 'Failure')));
          }
          if (state is ReservationLoaded) {
            return Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.models.length,
                      itemBuilder: (context, index) {
                        return ListItem(
                          onDelete: () {
                            context.read<ReservationBloc>().add(
                                DeleteGuestEvent(model: state.models[index]));
                          },
                          onTap: () {
                            _showModalBottomSheet(
                                context, true, state.models[index].roomNumber);
                          },
                          name:
                              '${state.models[index].name} ${state.models[index].lastname}',
                          roomNumber: state.models[index].roomNumber,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28),
                    child: ElevatedButton(
                      onPressed: () {
                        _showModalBottomSheet(context, false, 101);
                      },
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.white),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 120),
                          )),
                      child: Text(
                        'Add',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          if (state is ReservationLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ReservationFailure) {
            return const Center(child: Text('Ошибка'));
          }

          return Container();
        },
      ),
    );
  }

  Future<void> _showModalBottomSheet(
      BuildContext buildContext, bool isChange, int? roomNumber) async {
    await showModalBottomSheet(
      useRootNavigator: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      isScrollControlled: true,
      context: buildContext,
      builder: (context) => FractionallySizedBox(
          heightFactor: 0.9,
          child: BlocProvider.value(
            value: buildContext.read<ReservationBloc>(),
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  TextFieldWidget(title: 'Name', controller: nameController),
                  TextFieldWidget(
                      title: 'Lastname', controller: lastnameController),
                  TextFieldWidget(
                      title: 'Surname', controller: surnameController),
                  TextFieldWidget(
                      title: 'Phone number', controller: phoneController),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFieldWidget(
                            title: 'Day', controller: dayController),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: TextFieldWidget(
                            title: 'Month', controller: monthController),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        child: TextFieldWidget(
                            title: 'Year', controller: yearController),
                      ),
                      const SizedBox(
                        width: 3,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Tariff',
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            height: 3,
                          ),
                          CustomDropdownNoInput(
                              value: tariff,
                              onSelected: (value) {
                                setState(() {
                                  tariff = value;
                                });
                              },
                              items: ['Twin', 'Single', 'Double', 'Lux']),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Service',
                              style: Theme.of(context).textTheme.titleSmall),
                          const SizedBox(
                            height: 3,
                          ),
                          CustomDropdownNoInput(
                              value: tariff,
                              onSelected: (value) {
                                setState(() {
                                  service = value;
                                });
                              },
                              items: ['Sauna', 'Gym', 'Pool']),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          padding: const WidgetStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 100)),
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).primaryColor)),
                      onPressed: () async {
                        if (isChange) {
                          buildContext.read<ReservationBloc>().add(
                              ChangeGuestsInfoEvent(
                                  model: GuestReqModel(
                                      name: nameController.text,
                                      lastname: lastnameController.text,
                                      surname: surnameController.text,
                                      reservationStart: DateFormat('dd.MM.yyyy')
                                          .format(DateTime.now()),
                                      reservationEnd:
                                          '${dayController.text}.${monthController.text}.${yearController.text}',
                                      tariff: tariff,
                                      service: service,
                                      phoneNumber: phoneController.text,
                                      roomNumber: roomNumber)));
                          Navigator.pop(context);
                        } else {
                          buildContext.read<ReservationBloc>().add(AddGuestEvent(
                              model: GuestReqModel(
                                  name: nameController.text,
                                  lastname: lastnameController.text,
                                  surname: surnameController.text,
                                  reservationStart: DateFormat('dd.MM.yyyy')
                                      .format(DateTime.now()),
                                  reservationEnd:
                                      '${dayController.text}.${monthController.text}.${yearController.text}',
                                  tariff: tariff,
                                  service: service,
                                  phoneNumber: phoneController.text)));
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Accept',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(fontSize: 20),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
