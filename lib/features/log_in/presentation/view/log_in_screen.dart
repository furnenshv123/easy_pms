import 'package:auto_route/auto_route.dart';
import 'package:easy_pms/config/router/router.gr.dart';
import 'package:easy_pms/config/themes/app_theme.dart';
import 'package:easy_pms/features/log_in/domain/entities/user_entity.dart';
import 'package:easy_pms/features/log_in/presentation/bloc/bloc/login_bloc.dart';
import 'package:easy_pms/features/log_in/presentation/widgets/text_field_widget.dart';
import 'package:easy_pms/features/log_in/presentation/widgets/welcome_title.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final listOfNames = [
    'Name',
    'Password',
  ];

  final controllers = [TextEditingController(), TextEditingController()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
      body: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state is LoginLoading) {
              return loadingWidget();
            }
            if (state is LoginProcess) {
              AutoRouter.of(context).replace(const RouteNavigationRoute());
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const WelcomeTitle(),
                  const SizedBox(
                    height: 40,
                  ),
                  state is LoginError
                      ? errorWidget(state.message, context)
                      : const SizedBox(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: Column(
                        children: List.generate(2, (index) {
                      return TextFieldWidget(
                        title: listOfNames[index],
                        controller: controllers[index],
                        obscureMode: index == 1 ? true : false,
                      );
                    })),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 42),
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().add(LoginRequest(
                            entity: UserEntity(
                                name: controllers[0].text,
                                password: controllers[1].text)));
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll<Color>(
                              Theme.of(context).primaryColor)),
                      child: Text(
                        'Login account',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget loadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget errorWidget(String message, BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
            fontFamily: "Inter", color: Theme.of(context).highlightColor),
      ),
    );
  }
}


// listOfNames
//                       .map((e) => TextFieldWidget(
//                           controller: _controllers,
//                           title: e,
//                           obscureMode:
//                               listOfNames.indexOf(e) == 1 ? true : false))
//                       .toList(),