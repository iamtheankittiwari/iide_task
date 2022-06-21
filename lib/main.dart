import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iide_task/cart_items.dart';
import 'package:iide_task/items.dart';


void main(){
  runApp(const iide());
}


class iide extends StatelessWidget {
  const iide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("IIDE"),
        actions: [
          MaterialButton(
            child:const Icon(Icons.shopping_cart_outlined,color: Colors.white,),
              onPressed: (){
                Fluttertoast.showToast(msg: "Go to cart items",toastLength: Toast.LENGTH_SHORT);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartItems()));
              })
        ],
      ),
      body: ListView.builder(
        itemCount: Items.itemsAll.length,
          itemBuilder: (BuildContext context,index){
          return Card(
            child:ListTile(
              title: Text(Items.itemsAll[index]),
              trailing:
              IconButton(
                icon:  Icon(Items.cartItems.contains(Items.itemsAll[index])?Icons.add_task_outlined:Icons.add_shopping_cart),
                onPressed: () {

                  setState(() {
                    !Items.cartItems.contains(Items.itemsAll[index])?
                    Items.cartItems.add(Items.itemsAll[index]):Fluttertoast.showToast(msg: "Already added",toastLength: Toast.LENGTH_SHORT);
                  });
                  Fluttertoast.showToast(msg: Items.itemsAll[index].toString()+" added to cart",toastLength: Toast.LENGTH_SHORT);
                },
              )
            ),
          );
          }
      )
    );
  }
}

