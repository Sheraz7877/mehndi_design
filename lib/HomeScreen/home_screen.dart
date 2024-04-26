import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mehndi_app/HomeScreen/mehndi_pic_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.green,
        appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: Text(
              "Mehndi Designs",
              style: TextStyle(color: Colors.white, fontSize: 16),
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: GridView.builder(
              // shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 201,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 40,
                  crossAxisCount: 2),
              itemCount: mehndiImageList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: SizedBox(
                            // width: 400,
                            // height: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(Icons.close,color: Colors.blue,),
                            ),
                            SizedBox(height: 10,),
                                Image.asset(
                                  mehndiImageList[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                          // actions: <Widget>[
                            
                          // ],
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(mehndiImageList[index].image),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
