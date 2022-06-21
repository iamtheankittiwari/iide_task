import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'items.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key}) : super(key: key);

  @override
  _CartItemsState createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("IIDE"),
        ),
        body: ListView.builder(
            itemCount: Items.cartItems.length,
            itemBuilder: (BuildContext context,index){
              return Card(
                child:ListTile(
                  title: Text(Items.cartItems[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        Items.cartItems.remove(Items.cartItems[index]);
                      });
                      Fluttertoast.showToast(msg: "Item deleted from cart",toastLength: Toast.LENGTH_SHORT);
                    },
                  ),
                ),
              );
            }
        )
    );
  }
}
