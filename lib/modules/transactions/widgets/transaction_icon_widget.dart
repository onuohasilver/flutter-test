import 'package:flutter/material.dart';
import 'package:renmoney_flutter_test/modules/transactions/models/transaction_model.dart';
import 'package:renmoney_flutter_test/shared%20components/shared%20components.dart';
import 'package:renmoney_flutter_test/utilities/utilities.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({Key? key, required this.data}) : super(key: key);
  final IconWidgetData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 35.h,
      decoration: BoxDecoration(shape: BoxShape.circle, color: data.color),
      child: Center(child: data.image),
    );
  }
}

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

class IconWidgetData {
  final Color color;
  final Widget image;

  IconWidgetData(this.color, this.image);
}
