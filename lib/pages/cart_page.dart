// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:flutter_application_1/products/shoes.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItem(CartItem cartItem, Shoes shoes) {
    Provider.of<Cart>(context, listen: false).removeFromCart(cartItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${cartItem.shoes!.name} removed from cart.'),
        duration: Duration(seconds: 2),
      ),
    );
    setState(() {});
  }

  void removeItemformobile(CartItem cartItem, Mobile mobile) {
    Provider.of<Cart>(context, listen: false).removeFromCart(cartItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${cartItem.mobile!.name} removed from cart.'),
        duration: Duration(seconds: 1),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        Set<CartItem> userCart = cart.getUserCart();
        return Scaffold(
          appBar: AppBar(
            title: Text('My Cart'),
            automaticallyImplyLeading: false,
          ),
          body: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10)),
            child: ListView.builder(
              itemCount: userCart.length,
              itemBuilder: (context, index) {
                CartItem cartItem = userCart.elementAt(index);

                if (cartItem.mobile != null) {
                  return _buildMobileCartItem(cartItem, cartItem.mobile!);
                } else if (cartItem.shoes != null) {
                  return _buildShoesCartItem(cartItem, cartItem.shoes!);
                } else {
                  return SizedBox
                      .shrink(); // Placeholder for other types of items
                }
              },
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement your confirm order logic here
                // For example, you can navigate to a new page for order confirmation
              },
              child: Text('Confirm Order'),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileCartItem(CartItem cartItem, Mobile mobile) {
    return ListTile(
        leading: Image.asset(mobile.imgpath),
        title: Text(mobile.name),
        subtitle: Row(
          children: [
            Expanded(
              child: Text("Price : Rs ${mobile.price}/-"),
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("Quantity :${mobile.quantity} ")]),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () => removeItemformobile(cartItem, mobile),
            ),
          ],
        ));
  }

  Widget _buildShoesCartItem(CartItem cartItem, Shoes shoes) {
    return ListTile(
      leading: Image.asset(shoes.imgpath),
      title: Text(shoes.name),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text("Price : Rs ${shoes.price}/-"),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("Quantity :${shoes.quantity} "),
          ]),
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
        onPressed: () => removeItem(cartItem, shoes),
      ),
    );
  }
}
