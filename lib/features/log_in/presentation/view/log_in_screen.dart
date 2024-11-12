import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 130),
          child: Container(
            alignment: Alignment.center,
            
            color: const Color.fromRGBO(75, 73, 164, 1),
            child: Text(
              'LOG IN',
              style: TextStyle(fontFamily: "Inter", color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
            ),

          )),
    );
  }
}
