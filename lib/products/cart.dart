import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:flutter_application_1/products/shoes.dart';

// Define a union type for cart items
class CartItem {
  final Mobile? mobile;
  final Shoes? shoes;

  CartItem({this.mobile, this.shoes});
}

class Cart extends ChangeNotifier {
  // List of products
  List<Mobile> mobileList = [
    Mobile(
        name: "Samsung Galaxy",
        price: "20,00",
        description: " Android  5G 4GB RAM",
        imgpath: 'assets/images/samsung23.jpg',
        quantity: 1),

    Mobile(
        name: "iphone",
        price: "300,00",
        imgpath: "assets/images/iphone15.jpg",
        description: "new model forbidden",
        quantity: 1),
    Mobile(
        name: "Oneplus",
        price: "300,00",
        imgpath: "assets/images/oneplus12r.jpg",
        description: "new model forbidden",
        quantity: 1),

    Mobile(
        name: "Oneplus",
        price: "300,00",
        imgpath: "assets/images/oneplus12r.jpg",
        description: "new model forbidden",
        quantity: 1),
    // Add more mobiles here...
  ];

  List<Shoes> shoesList = [
    Shoes(
      name: "NIke",
      price: "1000.0",
      description: 'new arrival',
      imgpath: 'assets/images/nikeair.jpg',
      quantity: 1,
    ),
    Shoes(
        name: "NIke Air 18",
        price: "1000.0",
        description: 'new arrival',
        imgpath: 'assets/images/nikeair18.jpg',
        quantity: 1),
    Shoes(
        name: "NIke womens Air",
        price: "1000.0",
        description: 'new arrival',
        imgpath: 'assets/images/nikeairwomens.jpg',
        quantity: 1),
    Shoes(
        name: "NIke",
        price: "1000.0",
        description: 'new arrival',
        imgpath: 'assets/images/nikeair.jpg',
        quantity: 1),

    // Add more shoes here...
  ];

  // List of products in the cart
  Set<CartItem> userCart = {};

  // Get list of mobiles for sale
  List<Mobile> getMobileList() {
    return mobileList;
  }

  // Get list of shoes for sale
  List<Shoes> getShoesList() {
    return shoesList;
  }

  // Get list of products in the user's cart
  Set<CartItem> getUserCart() {
    return userCart;
  }

  // Add mobile to cart
  void addMobileToCart(Mobile mobile) {
    userCart.add(CartItem(mobile: mobile));
    notifyListeners();
  }

  // Add shoes to cart
  void addShoesToCart(Shoes shoes) {
    userCart.add(CartItem(shoes: shoes));
    notifyListeners();
  }

  // Remove item from cart
  void removeFromCart(CartItem item) {
    userCart.remove(item);
    notifyListeners();
  }

  void incshoeQuantity(CartItem item) {
    item.shoes?.quantity++;
    notifyListeners();
  }

  void incmobileQuantity(CartItem item) {
    item.mobile?.quantity++;
    notifyListeners();
  }
}
