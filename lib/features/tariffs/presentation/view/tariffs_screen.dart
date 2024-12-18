import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/features/tariffs/presentation/widgets/item_widget.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TariffsScreen extends StatefulWidget {
  const TariffsScreen({super.key});

  @override
  State<TariffsScreen> createState() => _TariffsScreenState();
}

class _TariffsScreenState extends State<TariffsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          ItemWidget(
            roomType: 'Single',
            description: 'Cozy classic one-room room for single occupancy.',
            price: 50,
          ),
          ItemWidget(
            roomType: 'Double',
            description:
                'Classic one-room suite with a large double bed and a sitting area.',
                price: 80,
          ),
          ItemWidget(
            roomType: 'Twin',
            description:
                'Classic one-room suite with two single beds and a sitting area.',
                price: 100,
          ),
          ItemWidget(
            roomType: 'Lux',
            description:
                'Spacious double room consisting of a bedroom and a living room.',
                price: 250,
          )
        ],
      ),
    );
  }
}
