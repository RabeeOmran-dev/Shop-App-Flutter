import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_ro/providers/products.dart';
import 'package:shop_ro/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  const ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final prducts = showFavs ? productData.favoriteItems : productData.items;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: prducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, i) {
          return ChangeNotifierProvider.value(
            value:  prducts[i],
            child: ProductItem(
                // prducts[i].id,
                // prducts[i].title,
                // prducts[i].imageUrl,
                ),
          );
        });
  }
}
