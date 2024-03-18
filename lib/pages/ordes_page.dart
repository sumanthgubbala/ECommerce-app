import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:provider/provider.dart';

class ConfirmedOrdersPage extends StatelessWidget {
  const ConfirmedOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmed Orders'),
      ),
      body: Consumer<Cart>(
        builder: (context, cart, _) {
          Set<CartItem> confirmedOrders = cart.getConfirmedOrders();
          if (confirmedOrders.isEmpty) {
            return Center(
              child: Text('No confirmed orders yet.'),
            );
          } else {
            return ListView.builder(
              itemCount: confirmedOrders.length,
              itemBuilder: (context, index) {
                // Convert set to list for easier iteration
                List<CartItem> confirmedOrdersList = confirmedOrders.toList();
                CartItem cartItem = confirmedOrdersList[index];
                String title = '';
                String price = '';
                int quantity = 0;
                // Check if cartItem contains a Mobile or Shoes
                if (cartItem.mobile != null) {
                  title = cartItem.mobile!.name;
                  price = cartItem.mobile!.price;
                  quantity = cartItem.mobile!.quantity;
                } else if (cartItem.shoes != null) {
                  title = cartItem.shoes!.name;
                  price = cartItem.shoes!.price;
                  quantity = cartItem.shoes!.quantity;
                }
                return ListTile(
                  title: Text(title),
                  subtitle: Text('Price: Rs $price/-'),
                  trailing: Text('Quantity: $quantity'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
