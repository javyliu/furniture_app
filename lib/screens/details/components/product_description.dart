import 'package:flutter/material.dart';
import 'package:furniture_app/models/product.dart';

import '../../../constant.dart';
import '../../../size_config.dart';


class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key key,
    @required this.product, this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        left: defaultSize * 2,
        right: defaultSize * 2,
      ),
//            height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(defaultSize * 1.2),
          topLeft: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.subTitle, style: TextStyle(fontSize: defaultSize * 1.8, fontWeight: FontWeight.bold),),
            SizedBox(height: defaultSize * 3,),
            Text(product.description, style: TextStyle(color: textColor.withOpacity(0.7), height: 1.5),),
            SizedBox(height: defaultSize * 3,),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                padding: EdgeInsets.all(defaultSize * 1.5),
                color: primaryColor,
                child: Text('Add to Cart', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                onPressed: press,
              ),
            )
          ],
        ),
      ),
    );
  }
}
