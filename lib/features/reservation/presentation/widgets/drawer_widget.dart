import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget(
      {super.key,
      required this.list,
      required this.currentIndex,
      required this.onTap});
  final List<String> list;
  int currentIndex;
  final Function(int)? onTap;
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: List.generate(widget.list.length, (index) {
          return ListTile(
            title: Text(widget.list[index]),
            onTap: () {
              setState(() {
                widget.currentIndex = index;
                widget.onTap!(widget.currentIndex);
              });
            },
            selected: widget.currentIndex == index,
            trailing: const Icon(Icons.chevron_right),
          );
        }),
      ),
    );
  }
}
