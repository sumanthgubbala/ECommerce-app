// ignore_for_file: prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:provider/provider.dart';

class Cartitems extends StatefulWidget {
  final CartItem cartItem;

  const Cartitems({Key? key, required this.cartItem}) : super(key: key);

  @override
  State<Cartitems> createState() => _CartitemsState();
}

class _CartitemsState extends State<Cartitems> {
  void removeItem() {
    Provider.of<Cart>(context, listen: false).removeFromCart(widget.cartItem);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.cartItem.mobile!.name} removed from cart.'),
        duration: Duration(seconds: 2),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2, // Add a subtle shadow
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.mobile!.imgpath,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        title: Text(
          widget.cartItem.mobile!.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          widget.cartItem.mobile!.price,
          style: TextStyle(color: const Color.fromARGB(195, 158, 158, 158)),
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: removeItem,
        ),
      ),
    );
  }
}
