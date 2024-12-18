import 'package:flutter/material.dart';

class CustomDropdownNoInput extends StatefulWidget {
  final String? value;
  final void Function(String?)? onSelected;
  final List<String> items;
  const CustomDropdownNoInput(
      {Key? key,
      required this.value,
      required this.onSelected,
      required this.items})
      : super(key: key);

  @override
  _CustomDropdownNoInputState createState() => _CustomDropdownNoInputState();
}

class _CustomDropdownNoInputState extends State<CustomDropdownNoInput> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(40)),
      child: DropdownMenu<String>(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderSide: BorderSide.none)),
        menuStyle: MenuStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.white),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)))),
        initialSelection: widget.value,
        requestFocusOnTap: true,
        onSelected: widget.onSelected,
        dropdownMenuEntries:
            widget.items.map<DropdownMenuEntry<String>>((String text) {
          return DropdownMenuEntry<String>(
              labelWidget:
                  Text(text, style: Theme.of(context).textTheme.bodyLarge),
              value: text,
              label: text,
              style: MenuItemButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                overlayColor: const Color.fromARGB(255, 255, 255, 255),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ));
        }).toList(),
      ),
    );
  }
}
