import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  ListItem({super.key, this.name, this.roomNumber, required this.onTap, required this.onDelete});
  String? name;
  int? roomNumber;
  final void Function() onTap;
  final void Function() onDelete;
  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name ?? 'Name',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(widget.roomNumber.toString(),
                    style: Theme.of(context).textTheme.displayMedium)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 26),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: widget.onTap,
                  child: const Icon(
                    Icons.create,
                    size: 20,
                  ),
                  style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 30)),
                      surfaceTintColor:
                          WidgetStatePropertyAll(Colors.transparent),
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).primaryColor),
                      foregroundColor: WidgetStatePropertyAll(Colors.white)),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 30)),
                        surfaceTintColor:
                            WidgetStatePropertyAll(Colors.transparent),
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).highlightColor),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    onPressed: widget.onDelete,
                    child: const Icon(
                      Icons.delete_forever,
                      size: 20,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
