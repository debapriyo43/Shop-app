import 'package:flutter/material.dart';
import 'package:shop_app/providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final ProductId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProducts = Provider.of<Products>(context).findById(ProductId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child:
                    Image.network(loadedProducts.imageUrl, fit: BoxFit.cover)),
            SizedBox(
              height: 30,
            ),
            Text(
              '\$${loadedProducts.price}',
              style: TextStyle(color: Colors.blueGrey, fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Text(
                  loadedProducts.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ))
          ],
        ),
      ),
    );
  }
}
