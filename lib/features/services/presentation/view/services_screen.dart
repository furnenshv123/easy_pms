import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/features/services/presentation/widgets/service_widget.dart';
import 'package:easy_pms/shared/images.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          ServiceWidget(name: 'Sauna', price: 20, pictPath: saunaPict,),
          ServiceWidget(name: 'Gym', price: 10, pictPath: gymPict,),
          ServiceWidget(name: 'Pool',price: 15, pictPath: poolPict,)
        ],
      ),
    );
  }
}