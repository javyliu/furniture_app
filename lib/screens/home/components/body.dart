import 'package:flutter/material.dart';
import 'package:furniture_app/screens/home/components/recommend_products.dart';
import 'package:furniture_app/screens/home/components/title_text.dart';
import 'package:furniture_app/services/fetch_categories.dart';
import 'package:furniture_app/services/fetch_products.dart';

import '../../../size_config.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    print("-----默认尺寸：$defaultSize");

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: "Browse by Categories",
              ),
            ),

            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(categories: snapshot.data)
                  : CircularProgressIndicator(),
            ),
            Divider(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: TitleText(
                title: "Recommands For You",
              ),
            ),
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) => snapshot.hasData
                  ? RecommendProducts(products: snapshot.data)
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),

          ],
        ),
      ),
    );
  }
}
