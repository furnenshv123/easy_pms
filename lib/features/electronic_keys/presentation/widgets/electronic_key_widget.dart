import 'package:flutter/material.dart';

class ElectronicKeyWidget extends StatefulWidget {
  ElectronicKeyWidget(
      {super.key, this.name, this.roomNumber, required this.isActive});
  String? name;
  int? roomNumber;
  bool isActive;
  @override
  State<ElectronicKeyWidget> createState() => _ElectronicKeyWidgetState();
}

class _ElectronicKeyWidgetState extends State<ElectronicKeyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Theme.of(context).primaryColor,
          border: Border.all(
              width: 3,
              color: widget.isActive
                  ? const Color(0xFF119916)
                  : Theme.of(context).highlightColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getNameKey(widget.name, widget.roomNumber),
              IconButton(onPressed: (){
                setState(() {
                  widget.isActive = !widget.isActive;
                });
              }, icon: const Icon(Icons.sync, color: Colors.white,))
            ],
          )
        ],
      ),
    );
  }

  Widget _getNameKey(String? name, int? roomNumber) {
    if (name == '' || roomNumber == null) {
      return Text(
        'EasyPMS',
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 25, color: Colors.white),
      );
    } else {
      return Column(
        children: [
          Text(
            widget.name ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 25, color: Colors.white),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            widget.roomNumber.toString(),
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontSize: 25, color: Colors.white),
          )
        ],
      );
    }
  }
}
