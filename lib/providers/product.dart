import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shoppingapp/secrets.dart';

Secrets _secrets = Secrets();
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue){
    isFavorite = newValue;
    notifyListeners();
  }

  void toggleFavoriteStatus() async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        _secrets.API_KEY+  "/products/$id.json");
    try{
final response =      await     http.patch(url, body: json.encode({'isFavorite': isFavorite}));
  if(response.statusCode >=400){
    _setFavValue(oldStatus);
  }
    } catch (error){
      isFavorite = oldStatus;
      notifyListeners();
    }
  }
}
