import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/screens/cart_screen.dart';
import '../providers/cart.dart';
import '../providers/all_products.dart';
import '../widgets/badge.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    // ...
    final product = Provider.of<Products>(context).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details'),
          actions: [
            Consumer<Cart>(
              builder: (context, value, child) => Badge(
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        cartScreen.routeName,
                      );
                    },
                    icon: Icon(Icons.shopping_cart_checkout)),
                value: value.jumlah.toString(),
                color: Colors.red,
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 250,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                  )),
              SizedBox(
                height: 15,
              ),
              Text(
                product.title,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              Text("\$ " + product.price.toString(),
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              Text('Product Description :   ' + product.description,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              OutlinedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Stuff added to your cart'),
                      duration: Duration(seconds: 2),
                    ));
                    cart.addCart(product.id, product.title, product.price);
                  },
                  child: Text(
                    'Add to cart',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ));
  }
}
