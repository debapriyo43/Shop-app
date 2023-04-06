import 'package:flutter/material.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import './cart_screen.dart';
import '../widgets/products_grid.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart' as badgeWIDGET;
import '../providers/cart.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('MyShopApp'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favourites) {
                    _showOnlyFavourites = true;
                  } else {
                    _showOnlyFavourites = false;
                  }
                });
                // if (selectedValue == FilterOptions.Favourites) {
                //   _showOnlyFavourites = true;
                // } else {
                //   _showOnlyFavourites = false;
                // }
              },
              icon: Icon(Icons.more_vert),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: const Text('Only Favourites'),
                    value: FilterOptions.Favourites),
                PopupMenuItem(
                    child: const Text('Show All'), value: FilterOptions.All),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => badgeWIDGET.Badge(
                child: IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                  },
                ),
                value: cart.itemCount.toString(),
                color: Colors.black,
              ),
            ),
          ],
          shadowColor: Colors.amber),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
