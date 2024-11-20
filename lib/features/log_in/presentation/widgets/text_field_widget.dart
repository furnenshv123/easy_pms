import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({super.key, required this.title, this.obscureMode = false, required this.controller});
  final String title;
  bool obscureMode;
  TextEditingController controller;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: Theme.of(context).textTheme.titleSmall,),
          const SizedBox(height: 7,),
          TextField(
            controller: widget.controller,
            autocorrect: false,
            obscureText: widget.obscureMode,
            cursorColor: Theme.of(context).primaryColor,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40))),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
