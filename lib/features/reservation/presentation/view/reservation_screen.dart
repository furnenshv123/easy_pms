import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key});

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).scaffoldBackgroundColor,);
  }
}