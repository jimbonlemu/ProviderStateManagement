import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/cart_screen.dart';
import './providers/cart.dart';
import './providers/all_products.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Products(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
            fontFamily: 'Lato',
            primarySwatch: Colors.indigo,
            accentColor: Colors.teal),
        home: ProductsOverviewScreen(),
        // home: ScreenSMT(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          cartScreen.routeName: (ctx) => cartScreen(),
        },
      ),
    );
  }
}

// class ScreenSMT extends StatelessWidget {
//   const ScreenSMT({super.key});

//   @override
//   Widget build(BuildContext context) {
//     List<Text> myList = List.generate(
//         25,
//         (index) => Text(
//               '${index + 1}',
//               style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
//             ));
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//           child: ListView(children: [
//         Container(
//           color: Colors.indigo,
//           height: 100,
//           width: 100,
//         ),
//         ...myList,
//         Container(
//           color: Colors.indigo,
//           height: 100,
//           width: 100,
//         )
//       ])),
//     );
//   }
// }
