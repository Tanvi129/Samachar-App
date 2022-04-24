import 'package:flutter/material.dart';

class NewsCartItem extends StatefulWidget {
  const NewsCartItem({ Key? key }) : super(key: key);

  @override
  State<NewsCartItem> createState() => _NewsCartItemState();
}

class _NewsCartItemState extends State<NewsCartItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                                "assets/images/newsPlaceHolder.jpg")),
                        Positioned(
                          left: 0,
                          bottom: 0,
                          
                          child: Container(
                            
                            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(colors: [
                                      Colors.black12.withOpacity(0),
                                      Colors.black
                                    ],
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft)
                            ),
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:const <Widget>[
                              Text(
                                "News Headlines ",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Description of some news lol lol",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              )
                            ],
                        ),
                          ))
                      ]),
                    );
  }
}