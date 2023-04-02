import 'package:flutter/material.dart';
import 'package:project100/AddRequirementsScreen.dart';
import 'package:project100/shop_model.dart';

import 'constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShopListScreen(),
    );
  }
}

class ShopListScreen extends StatefulWidget {
  const ShopListScreen({Key? key}) : super(key: key);

  @override
  State<ShopListScreen> createState() => _ShopListScreenState();
}

class _ShopListScreenState extends State<ShopListScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController shopName = TextEditingController();

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ShopButton,
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 150,
                        width: 150,
                        child: Image.asset(
                            "assets/images/add-shopping-cart.webp")),
                    SizedBox(
                      height: 10,
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
                        hintText: 'Enter Shop name',
                      ),
                      controller: shopName,
                    ),
                    SizedBox(
                      height: 20,
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
                          shopsList
                              .add({'name': shopName.text, 'Requirements': []});
                          print(shopsList);
                          setState(() {});

                          Navigator.pop(context);
                        },
                        child: Text('Add Your shop'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          child: Icon(Icons.add),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              // snap: false,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    "SHOPS",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ), //Text
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/relaxed.jpg'))),
                  ) //Images.network
                  ), //FlexibleSpaceBar
              expandedHeight: 220,
              backgroundColor: ShopButtonlight,
              leading: IconButton(
                icon: Icon(Icons.menu),
                tooltip: 'Menu',
                color: Colors.white,
                onPressed: () {},
              ), //IconButton
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.comment),
                  tooltip: 'Comment Icon',
                  color: Colors.white,
                  onPressed: () {},
                ), //IconButton
                IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: 'Setting Icon',
                  color: Colors.white,
                  onPressed: () {},
                ), //IconButton
              ], //<Widget>[]
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return SizedBox(
                    height: 130,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddRequirementsScreen(
                              shopIndex: index,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 246, 245, 245),
                            border: Border.all(color: ShopButton),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Image.asset('assets/images/shop.png'),
                            title: Text(shopsList[index]['name']),
                            trailing: Icon(
                              Icons.arrow_circle_right_outlined,
                              size: 30,
                              color: ShopButton,
                            ),
                            //       trailing: Text(
                            // '$totalItemRate' ,style: TextStyle(fontSize: 20) ,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                childCount: shopsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
