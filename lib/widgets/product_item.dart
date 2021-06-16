import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    //print(product.id);
    return GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
              // (MaterialPageRoute(builder: (ctx) {
              //   return ProductDetailScreen(title);
              // }));
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        footer: Consumer<Product>(
          //another approach for listner
          builder: (ctx, product, _) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  splashColor: Theme.of(context).accentColor,
                  icon: Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    product.toggleFavouriteStatus();
                  },
                  color: Theme.of(context).accentColor,
                ),
                title: Text(
                  product.title,
                  textAlign: TextAlign.center,
                ),
                trailing: IconButton(
                  splashColor: Theme.of(context).accentColor,
                  onPressed: () {
                    cart.addItem(
                      product.id,
                      product.price,
                      product.title,
                    );
                  },
                  icon: Icon(Icons.shopping_cart),
                  color: Theme.of(context).accentColor,
                ),
              ),
            );
          },
        ));
  }
}
