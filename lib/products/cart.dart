import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:flutter_application_1/products/shoes.dart';

class Cart extends ChangeNotifier {
  // List of products
  List<Mobile> productList = [
    Mobile(
        name: "Samsung Galaxy",
        price: "20,00",
        description: " Android  5G 4GB RAM",
        imgpath: 'assets/images/samsung23.jpg'),
    Mobile(
        name: "iphone",
        price: "300,00",
        imgpath: "assets/images/iphone15.jpg",
        description: "new model forbidden"),
    Mobile(
        name: "Oneplus",
        price: "300,00",
        imgpath: "assets/images/oneplus12r.jpg",
        description: "new model forbidden"),
    Mobile(
        name: "Oneplus",
        price: "300,00",
        imgpath: "assets/images/oneplus12r.jpg",
        description: "new model forbidden"),
  ];

  List<Shoes> shoeslist = [
    Shoes(
      name: "NIke",
      price: "1000.0",
      description: 'new arrival',
      imgpath: 'assets/images/nikeair.jpg',
    ),
    Shoes(
      name: "NIke Air 18",
      price: "1000.0",
      description: 'new arrival',
      imgpath: 'assets/images/nikeair18.jpg',
    ),
    Shoes(
      name: "NIke womens Air",
      price: "1000.0",
      description: 'new arrival',
      imgpath: 'assets/images/nikeairwomens.jpg',
    ),
    Shoes(
      name: "NIke",
      price: "1000.0",
      description: 'new arrival',
      imgpath: 'assets/images/nikeair.jpg',
    ),
  ];

  // List of products in the cart
  List<Mobile> usercart = [];
  List<Shoes> usershoescart = [];

  // Get list of shoes
  List<Shoes> getShoesList() {
    return shoeslist;
  }

  // Get list of mobiles for sale
  List<Mobile> getMobilesList() {
    return productList;
  }

  // Get list of mobiles in the user's cart
  List<Mobile> getUserCart() {
    return usercart;
  }

  // Get list of shoes in the user's cart
  List<Shoes> getUserShoesCart() {
    return usershoescart;
  }

  // Add mobile to cart
  void addMobileToCart(Mobile mobile) {
    usercart.add(mobile);
    notifyListeners();
  }

  // Remove mobile from cart
  void removeMobileFromCart(Mobile mobile) {
    usercart.remove(mobile);
    notifyListeners();
  }

  // Add shoes to cart
  void addShoesToCart(Shoes shoes) {
    usershoescart.add(shoes);
    notifyListeners();
  }

  // Remove shoes from cart
  void removeShoesFromCart(Shoes shoes) {
    usershoescart.remove(shoes);
    notifyListeners();
  }
}
