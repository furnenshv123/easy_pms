import 'package:flutter/material.dart';

class RoomWidget extends StatefulWidget {
  RoomWidget(
      {super.key,
      required this.roomNumber,
      required this.countOfPerson,
      required this.isbusy});
  final int roomNumber;
  final int countOfPerson;
  bool isbusy;
  @override
  State<RoomWidget> createState() => _RoomWidgetState();
}

class _RoomWidgetState extends State<RoomWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: widget.isbusy ? Theme.of(context).primaryColor : Colors.white),
      child: Row(
        children: [
          Text(
            widget.roomNumber.toString(),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: widget.isbusy ? Colors.white : Colors.black),
          ),
          const SizedBox(
            width: 20,
          ),
          ...List.generate(widget.countOfPerson, (index) {
            return Icon(
              Icons.person,
              color:
                  widget.isbusy ? Colors.white : Theme.of(context).primaryColor,
            );
          })
        ],
      ),
    );
  }
}
