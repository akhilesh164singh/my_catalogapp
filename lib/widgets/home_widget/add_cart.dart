import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/model/cart.dart';
import 'package:catalog_app/model/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);
  //const _AddToCart({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.BluishColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      child: isInCart ? Icon(Icons.done) : "Buy".text.make(),
    );
  }
}
