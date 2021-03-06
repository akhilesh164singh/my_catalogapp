import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/model/cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: MyTheme.creamColor,
            title: "Cart".text.color(MyTheme.BluishColor).bold.make(),
          ),
          body: Column(
            children: [
              _cartList().p32().expand(),
              Divider(),
              _cartTotal(),
            ],
          ),
        ),
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  //const ({ Key? key }) : super(key: key);
  //final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, VxStatus) {
              return "\$${_cart.totalprice}".text.bold.make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.BluishColor)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buying is not supported yet".text.make(),
              ));
            },
            child: "Buy".text.make(),
          )
        ],
      ),
    );
  }
}

class _cartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.done),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      RemoveMutation(_cart.items[index]);
                    },
                  ),
                  title: _cart.items[index].name.text.make(),
                ));
  }
}
