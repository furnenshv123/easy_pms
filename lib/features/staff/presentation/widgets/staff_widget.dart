import 'package:flutter/material.dart';

class StaffWidget extends StatefulWidget {
  StaffWidget({super.key, this.name, this.task, this.type,  this.showDialog});
  String? task;
  String? name;
  String? type;
  void Function()? showDialog;
  @override
  State<StaffWidget> createState() => _StaffWidgetState();
}

class _StaffWidgetState extends State<StaffWidget> {
  TextEditingController taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    size: 64,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name ?? 'Name',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.type ?? 'Type',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: const Color(0xFFABAAAA)),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 120,
                child: Flexible(
                  child: Text(
                    widget.task ?? 'Task',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 80,
                height: 35,
                child: ElevatedButton(
                  onPressed: widget.showDialog,
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                  ),
                  child: Text(
                    'Add',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
