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
        duration: Duration(seconds: 2),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, _) {
        List<CartItem> userCart = cart.getUserCart();
        return Scaffold(
          appBar: AppBar(
            title: Text('My Cart'),
          ),
          body: ListView.builder(
            itemCount: userCart.length,
            itemBuilder: (context, index) {
              CartItem cartItem = userCart[index];

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
        );
      },
    );
  }

  Widget _buildMobileCartItem(CartItem cartItem, Mobile mobile) {
    return ListTile(
        leading: Image.asset(mobile.imgpath),
        title: Text(mobile.name),
        subtitle: Text(mobile.price),
        trailing: Column(
          children: [
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => removeItemformobile(cartItem, mobile),
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () => removeItemformobile(cartItem, mobile),
            ),
          ],
        ));
  }

  Widget _buildShoesCartItem(CartItem cartItem, Shoes shoes) {
    return ListTile(
      leading: Image.asset(shoes.imgpath),
      title: Text(shoes.name),
      subtitle: Text(shoes.price),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => removeItem(cartItem, shoes),
      ),
    );
  }
}
