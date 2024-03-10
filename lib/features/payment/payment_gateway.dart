import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class paypalGateway extends StatelessWidget {
  paypalGateway({
    super.key,
    required this.productName,
    required this.price,
    required this.onSuccess,
  });

  int price;
  String productName;
  Function onSuccess;

  @override
  Widget build(BuildContext context) {
    return UsePaypal(
        sandboxMode: true,
        clientId:
            "Aa4hPHQc05a2gzuy2Pe49jtMYdTP7qRxP1K9G0h29DmF1_AxKu_gWFQsoYXRe2zykrZi_rqfx3VQfyjd",
        secretKey:
            "EOWGkWEB3VtCh_FNBpX8z5tI-TyQZX8Hsbd2w_OPZBGQxnFTr0vS9WVeS-zXS3wKqyTJFuDgTbLd-z_S",
        returnURL: "https://samplesite.com/return",
        cancelURL: "https://samplesite.com/cancel",
        transactions: [
          {
            "amount": {
              "total": '$price',
              "currency": "USD",
              "details": {
                "subtotal": '$price',
                "shipping": '0',
                "shipping_discount": 0
              }
            },
            "description": "The payment transaction description.",
            // "payment_options": {
            //   "allowed_payment_method":
            //       "INSTANT_FUNDING_SOURCE"
            // },
            "item_list": {
              "items": [
                {
                  "name": productName,
                  "quantity": 1,
                  "price": price,
                  "currency": "USD"
                }
              ],
            }
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: onSuccess,
        onError: (error) {
          print("onError: $error");
        },
        onCancel: (params) {
          print('cancelled: $params');
        });
  }
}
