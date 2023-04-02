import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project100/constant.dart';

class Addtocart extends StatefulWidget {
  const Addtocart({Key? key}) : super(key: key);

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: ShopButton,
      ),
    );
  }
}
