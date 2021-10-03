import 'package:flutter/material.dart';
import '../../../core/components/container/round_edge_container.dart';
import '../list_tile/payment_list_tile.dart';

class PaymentCard extends RoundEdgeContainer {
  PaymentCard({
    @required this.text1,
    @required this.text2,
    @required this.radioButton1,
    @required this.radioButton2,
    this.iconPath1,
    this.iconPath2,
  }) : super(
            child: Column(
          children: [
            PaymentListTile(
              text: text1,
              radioButton: radioButton1,
              iconPath: iconPath1,
            ),
            Divider(
              thickness: 2,
              indent: 16,
              endIndent: 16,
            ),
            PaymentListTile(
              text: text2,
              radioButton: radioButton2,
              iconPath: iconPath2,
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ));

  final String iconPath1;
  final String iconPath2;
  final Radio radioButton1;
  final Radio radioButton2;
  final String text1;
  final String text2;
}
