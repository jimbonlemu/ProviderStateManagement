import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MyShop'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return Badge(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        cartScreen.routeName,
                      );
                    },
                    icon: Icon(Icons.shopping_cart_checkout)),
                value: value.jumlah.toString(),
                color: Colors.red,
              );
            },
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
