import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/config/themes/app_theme.dart';
import 'package:easy_pms/features/log_in/presentation/widgets/text_field_widget.dart';
import 'package:easy_pms/features/log_in/presentation/widgets/welcome_title.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final listOfNames = ['Name', 'Password'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 130),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(color: Colors.black, spreadRadius: 0, blurRadius: 4)
              ],
              color: Theme.of(context).primaryColor,
            ),
            child: Text(
              "LOG IN",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeTitle(),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Column(
                children: listOfNames
                    .map((e) => TextFieldWidget(
                        title: e,
                        obscureMode: listOfNames.indexOf(e) == 1 ? true : false))
                    .toList(),
              ),
            ),
            const SizedBox(height: 50,),
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: ElevatedButton(
                onPressed: () {},
                
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Theme.of(context).primaryColor)),
                child: Text('Login account', style: Theme.of(context).textTheme.labelSmall,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
