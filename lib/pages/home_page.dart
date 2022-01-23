import 'dart:convert';

import 'package:catalog_app/widgets/home_widget/catalog_header.dart';
import 'package:catalog_app/widgets/home_widget/catalog_list.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:catalog_app/model/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import 'package:catalog_app/widgets/item_widget.dart';
import 'package:catalog_app/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  const HomePage({ Key? key }) : super(key: key);

  int days = 30;

  String name = "Akhilesh Singh";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(seconds: 2));
    final catalogjson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodeData = jsonDecode(catalogjson);
    var productData = decodeData["product"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    //print(CatalogModel.items);
  }

  @override
  Widget build(BuildContext context) {
    //  final dummyData = List.generate(10, (index) => CatalogModel.items[0]);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
          backgroundColor: MyTheme.creamColor,
          body: SafeArea(
            child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatalogHeader(),
                  CatalogList().expand(),
                ],
              ),
            ),
          )),
    );
  }
}
