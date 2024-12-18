import 'package:easy_pms/shared/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget(
      {super.key, this.pictPath, this.roomType, this.description, this.price});
  String? pictPath;
  String? roomType;
  String? description;
  int? price;
  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.roomType == 'Single') {
      widget.pictPath = singlePict;
    } else if (widget.roomType == 'Twin') {
      widget.pictPath = twinPict;
    } else if (widget.roomType == 'Double') {
      widget.pictPath = doublePict;
    } else if (widget.roomType == 'Lux') {
      widget.pictPath = luxPict;
    }
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40), color: Colors.white),
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 142,
                  width: 161,
                  margin: const EdgeInsets.all(14),
                  child: Image.asset(
                    widget.pictPath!,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(40)),
                      child: Text(
                        '${widget.roomType} room',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    SizedBox(
                      width: 120,

                      child: Flexible(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.description ??
                              'Nonedzdggaegfsgsergsergesrgesrgserg',
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    )
                  ],
                )
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
