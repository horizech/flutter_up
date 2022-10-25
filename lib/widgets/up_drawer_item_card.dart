import 'package:flutter/material.dart';
import 'package:flutter_up/models/up_drawer_item.dart';

class UpDrawerItemCard extends StatelessWidget {
  const UpDrawerItemCard({Key? key, required this.item}) : super(key: key);

  final UpDrawerItem item;

  @override
  Widget build(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context).textTheme.headline4;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(item.icon, size: 128.0, color: textStyle!.color),
            Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
