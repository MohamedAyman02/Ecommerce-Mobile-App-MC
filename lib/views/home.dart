import 'package:ecommerce_app/containers/promo_container.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Best Deals", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),),
    body: Column(children: [
      PromoContainer()
    ],),
    );
  }
}