import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class ElectronicKeysScreen extends StatefulWidget {
  const ElectronicKeysScreen({super.key});

  @override
  State<ElectronicKeysScreen> createState() => _ElectronicKeysScreenState();
}

class _ElectronicKeysScreenState extends State<ElectronicKeysScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Theme.of(context).highlightColor);
  }
}