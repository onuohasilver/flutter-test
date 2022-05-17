import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/modules/transactions/widgets/transaction_icon_widget.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';

IconWidgetData getIconByType(String value) {
  TransactionType type = getTransactionType(value);
  switch (type) {
    case TransactionType.deposit:
      return IconWidgetData(
          const Color(0xff65adc4).withOpacity(.1),
          const RotatedBox(
              quarterTurns: 2,
              child: ShowSVG(ImageAsset.arrowUp,
                  height: 10, width: 8.05, color: Colors.green)));
    case TransactionType.phone:
      return IconWidgetData(
          Colors.red, const ShowSVG(ImageAsset.phone, height: 10, width: 8.05));
    case TransactionType.withdrawal:
      return IconWidgetData(const Color.fromRGBO(119, 101, 196, 0.098),
          const ShowSVG(ImageAsset.arrowUp, height: 10, width: 8.05));

    default:
      return IconWidgetData(Colors.green,
          const ShowSVG(ImageAsset.arrowUp, height: 10, width: 8.05));
  }
}