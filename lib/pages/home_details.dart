import 'package:catalog_app/widgets/home_widget/add_cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';

import 'package:catalog_app/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetails extends StatelessWidget {
  //const HomeDetails({Key? key}) : super(key: key);
  final Item catalog;
  const HomeDetails({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.bold.xl4.make(),
            AddToCart(
              catalog: catalog,
            ).wh(100, 40)
          ],
        ).p16(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .p16(),
            Expanded(
                child: VxArc(
              height: 30,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl2.bold
                        .color(MyTheme.BluishColor)
                        .bold
                        .make(),
                    catalog.desc.text.make(),
                    10.heightBox,
                  ],
                ).p64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
