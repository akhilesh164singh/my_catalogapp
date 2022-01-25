import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field

  late CatalogModel _catalog;
  //collection of ids -store ids of each item
  final List<int> _itemIds = [];

  //GET Catalog

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get Item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //Get total price
  num get totalprice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  @override
  final Item item;

  AddMutation(this.item);
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  @override
  final Item item;

  RemoveMutation(this.item);
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
