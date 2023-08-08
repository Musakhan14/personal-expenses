import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendinAmount;
  final double spendingPctOfTotal; //spending percenttage of total
  ChartBar(
    this.label,
    this.spendinAmount,
    this.spendingPctOfTotal,
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraint) {
        return Column(
          children: [
            Container(
                height: constraint.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\$${spendinAmount.toStringAsFixed(0)}'))),
            SizedBox(height: constraint.maxHeight * 0.05),
            Container(
              height: constraint.maxHeight * 0.5,
              width: 9,
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ]),
            ),
            SizedBox(height: constraint.maxHeight * 0.05),
            Container(
              height: constraint.maxHeight * 0.15,
              child: FittedBox(child: Text(label)),
            )
          ],
        );
      },
    );
  }
}
