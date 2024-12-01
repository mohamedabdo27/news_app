import 'package:flutter/material.dart';

class LinesList extends StatelessWidget {
  const LinesList({
    super.key,
    required this.itemCount,
    this.color = Colors.grey,
    this.height = 10,
    this.width,
  });
  final int itemCount;
  final Color color;
  final double? width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Align(
        alignment: Alignment.centerLeft,
        child: Container(
          height: 10,
          width: width ??
              (index == itemCount - 1
                  ? MediaQuery.of(context).size.width - 130
                  : double.infinity),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      itemCount: itemCount,
      separatorBuilder: (context, index) => SizedBox(
        height: index == itemCount - 1 ? 0 : 4,
      ),
    );
  }
}
