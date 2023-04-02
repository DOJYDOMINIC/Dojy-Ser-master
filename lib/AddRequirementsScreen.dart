import 'package:flutter/material.dart';
import 'package:project100/models/requirements_model.dart';
import 'package:project100/shop_model.dart';

import 'Amount_Container.dart';
import 'constant.dart';

class AddRequirementsScreen extends StatefulWidget {
  const AddRequirementsScreen({Key? key, required this.shopIndex})
      : super(key: key);
  final int shopIndex;

  @override
  State<AddRequirementsScreen> createState() => _AddRequirementsScreenState();
}

class _AddRequirementsScreenState extends State<AddRequirementsScreen> {
  final TextEditingController itemName = TextEditingController();
  final TextEditingController itemQty = TextEditingController();
  final TextEditingController itemRate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add Requirements'),
          backgroundColor: ShopButton,
          actions: [
            IconButton(
              icon: Icon(Icons.add,size:30,),
              onPressed: () => showModalBottomSheet(
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 97, 61, 230),
                                    width: 2.0),
                              ),
                              hintText: 'Enter Your Item ',
                            ),
                            controller: itemName,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 97, 61, 230),
                                    width: 2.0),
                              ),
                              hintText: 'Enter Your Quantity',
                            ),
                            keyboardType: TextInputType.number,
                            controller: itemQty,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 97, 61, 230),
                                    width: 2.0),
                              ),
                              hintText: 'Amount',
                            ),
                            keyboardType: TextInputType.number,
                            controller: itemRate,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            width: 120,
                            height: 55,
                            color: ShopButton,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                backgroundColor: Colors.red.withOpacity(0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(2),
                                    ),
                                    side: BorderSide(color: Colors.white)),
                              ),
                              onPressed: () {
                                shopsList[widget.shopIndex]['Requirements'].add(
                                  RequirementsModel(
                                    itemName: itemName.text,
                                    qty: double.parse(itemQty.text),
                                    rate: double.parse(itemRate.text)
                                  ),
                                );

                                print("item added");
                                print(shopsList[widget.shopIndex]
                                        ['Requirements']
                                    .length);
                                setState(() {});
                                Navigator.pop(context);
                              },
                              child: Text('Add'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Container(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Name',style:fontsize1),
                      Text('Nos',style:fontsize1),
                      Text('Price',style:fontsize1),
                      Text('Total',style:fontsize1)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: ListView.builder(
                  // shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: shopsList[widget.shopIndex]['Requirements'].length,
                  itemBuilder: (context, index) {
                    num totalItemRate = shopsList[widget.shopIndex]
                                ['Requirements'][index]
                            .qty *
                        shopsList[widget.shopIndex]['Requirements'][index].rate;
                    return SizedBox(
                      height: 80,
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.black.withOpacity(.1)),
                          color: Colors.white,
                        ),
                        // child: ListTile(
                        //
                        //   leading: Padding(
                        //     padding: const EdgeInsets.only(right: 50),
                        //     child: Text(
                        //       shopsList[widget.shopIndex]['Requirements'][index]
                        //           .itemName
                        //           .toString(),
                        //       style: TextStyle(
                        //           fontSize: 20, fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        //   title: Padding(
                        //     padding: const EdgeInsets.only(left: 13),
                        //     child: Text(
                        //       shopsList[widget.shopIndex]['Requirements'][index]
                        //           .qty
                        //           .toString(),
                        //       style: TextStyle(fontSize: 20),
                        //     ),
                        //   ),
                        //   trailing: Text(
                        //     '$totalItemRate',
                        //     style: TextStyle(fontSize: 20),
                        //   ),
                        //
                        // ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(
                                textDirection: TextDirection.rtl,
                                shopsList[widget.shopIndex]['Requirements'][index]
                                    .itemName
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Text(
                                textDirection: TextDirection.rtl,
                                shopsList[widget.shopIndex]['Requirements'][index]
                                    .qty
                                    .toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 13),
                              child: Text(
                                textDirection: TextDirection.rtl,
                                shopsList[widget.shopIndex]['Requirements'][index]
                                    .rate
                                    .toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              '$totalItemRate',
                              style: TextStyle(fontSize: 20),
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex:3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AmountContainer(),
                ),
              )
            ],
          ),
        ));
  }
}
