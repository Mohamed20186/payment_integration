import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'payment_item.dart';

class PaymentMethdosItems extends StatefulWidget {
  PaymentMethdosItems({
    super.key,
  });

  @override
  State<PaymentMethdosItems> createState() => _PaymentMethdosItemsState();
}

class _PaymentMethdosItemsState extends State<PaymentMethdosItems> {
  final List<String> paymentMethdosItemList = [
    'assets/images/card.svg',
    'assets/images/pay.svg',
    'assets/images/paybal.svg'
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return SizedBox(
      height: 80,
      width: mediaQuery.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethdosItemList.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    activeIndex = index;
                  });
                },
                child: PaymentItem(
                  imgPath: paymentMethdosItemList[index],
                  isActive: activeIndex == index,
                ),
              )),
    );
  }
}
