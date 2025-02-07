import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(children: [Container(child: Row(children: [Text("Clothes"),  
      IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down))
      ],),)],),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      leading: BackButton(),
      elevation: 0,
      title: Text(
        "Shop Ecco",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        IconButton(
            onPressed: () {}, icon: Icon(Icons.notifications_none_outlined)),
        IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
      ],
    );
  }
}
