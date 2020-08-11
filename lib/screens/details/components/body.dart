import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/constant.dart';
import 'package:furniture_app/models/product.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: textColor.withOpacity(0.6));

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            height: defaultSize * 37.5,
            width: defaultSize * 15,
//            color: Colors.black45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  product.category.toUpperCase(),
                  style: lightTextStyle,
                ),
                Text(
                  product.title,
                  style: TextStyle(
                    fontSize: defaultSize * 2.4,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.8,
                    height: 1.4,
                  ),
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                Text(
                  'Form',
                  style: lightTextStyle,
                ),
                Text(
                  "\$${product.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSize * 1.6,
                    height: 1.6,
                  ),
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                Text(
                  'Available Color',
                  style: lightTextStyle,
                ),
                Row(
                  children: <Widget>[
                    buildColorBox(defaultSize, color: Color(0xFF7BA275)),
                    buildColorBox(defaultSize, color: Color(0xffd7d7d7)),
                    buildColorBox(defaultSize, color: textColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive ? SvgPicture.asset("assets/icons/check.svg") : SizedBox(),
    );
  }
}
