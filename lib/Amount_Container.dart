import 'package:flutter/material.dart';

import 'Add_to_cart.dart';
import 'constant.dart';

class AmountContainer extends StatefulWidget {
  AmountContainer({
    super.key,
  });

  @override
  State<AmountContainer> createState() => _AmountContainerState();
}

class _AmountContainerState extends State<AmountContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color.fromARGB(255, 97, 61, 230), width: 2),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Amount ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
            SizedBox(width:MediaQuery.of(context).size.width* .52),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>Addtocart()));
              },
              child: Container(
                height: 40,
                width: 40,
                color: Colors.grey.shade200,
                  child: Icon(Icons.add_shopping_cart_outlined,color: ShopButton,size: 30,)),
            )

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Price item : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      ),
                      Text(
                        "120",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "GST: ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      ),
                      Text(
                        "12",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount : ",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 97, 61, 230)),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total : ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Shoptext),
                      ),
                      Text(
                        "100.00",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Shoptext),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
