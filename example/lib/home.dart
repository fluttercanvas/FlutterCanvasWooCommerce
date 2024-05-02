import 'package:flutter/material.dart';
import 'package:flutter_canvas_woocommerce/flutter_canvas_woocommerce.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  List<Product> products_fetched = [];
  bool product_loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('DEMO'),
          if (products_fetched.isNotEmpty)
            Container(
              color: const Color.fromARGB(255, 240, 240, 240),
              height: 500,
              width: 720,
              child: ListView.builder(
                itemCount: products_fetched.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            '${index + 1} - id: ${products_fetched[index].id} - ${products_fetched[index].name}'),
                        Text('Price - ${products_fetched[index].price}'),
                        Text(
                            'Sale Price - ${products_fetched[index].salePrice}')
                      ],
                    ),
                  );
                },
              ),
            ),
          if (product_loading) LinearProgressIndicator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    products_fetched =
                        await FlutterCanvasWooCommerce.instance.fetchProducts();
                  },
                  child: const Text('Fetch Products')),
            ],
          )
        ],
      ),
    );
  }
}
