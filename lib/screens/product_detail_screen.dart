import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {

static const routeName = '/route-detail';
  @override
  Widget build(BuildContext context) {
  ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text("title"),
      ),
    );
  }
}
