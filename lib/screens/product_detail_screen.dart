import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;
  // final String imageUrl;

  // ProductDetailScreen(this.title, this.price, this.imageUrl);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; //is the id!
    //...
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     loadedProduct.title,
      //     style: Theme.of(context).textTheme.bodyText2,
      //   ),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                loadedProduct.title,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10,
              ),
              Text('\$${loadedProduct.price}',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: Text(
                  loadedProduct.description,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
              SizedBox(height: 800),
            ]),
          ),
        ],
      ),
    );
  }
}
