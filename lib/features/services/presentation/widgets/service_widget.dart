import 'package:flutter/material.dart';

class ServiceWidget extends StatefulWidget {
  ServiceWidget({super.key, this.name, this.price, this.pictPath});
  String? name;
  int? price;
  String? pictPath;
  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            margin: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Text(
                    widget.name!,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(14),
                  child: Image.asset(
                    widget.pictPath!,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(40)),
            child: Text(
              '${widget.price}USD',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ),
        ],
      ),
    );
  }
}
