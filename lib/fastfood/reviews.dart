import 'package:Delivery_App/widgets/round_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen({super.key});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
    bool star1 = false;
    bool star2 = false;
    bool star3 = false;
    bool star4 = false;
    bool star5 = false;
  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Write a Reviews',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body:  Padding(
        padding:  EdgeInsets.only(top: hieght*0.1,left: width*0.03,right: width*0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        star1 = true;
                        star2 = false;
                        star3 = false;
                        star4 = false;
                        star5 = false;
                      });
                    },
                    child:star2==true?const Icon(Icons.star,color: Colors.yellow,) : const Icon(Icons.star_outline_outlined,color: Colors.grey,size: 35,)
                    ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        star1 = false;
                        star2 = true;
                        star3 = false;
                        star4 = false;
                        star5 = false;
                      });
                    },
                    child:star1==true?const Icon(Icons.star,color: Colors.yellow,) : const Icon(Icons.star_outline_outlined,color: Colors.grey,size: 35,)
                    ),
                    InkWell(
                    onTap: () {
                      setState(() {
                        star1 = false;
                        star2 = false;
                        star3 = true;
                        star4 = false;
                        star5 = false;
                      });
                    },
                    child:star3==true?const Icon(Icons.star,color: Colors.yellow,) : const Icon(Icons.star_outline_outlined,color: Colors.grey,size: 35,)
                    ),
                    InkWell(
                    onTap: () {
                      setState(() {
                        star1 = false;
                        star2 = false;
                        star3 = false;
                        star4 = true;
                        star5 = false;
                      });
                    },
                    child:star4==true?const Icon(Icons.star,color: Colors.yellow,) : const Icon(Icons.star_outline_outlined,color: Colors.grey,size: 35,)
                    ),
                    InkWell(
                    onTap: () {
                      setState(() {
                        star1 = false;
                        star2 = false;
                        star3 = false;
                        star4 = false;
                        star5 = true;
                      });
                    },
                    child:star5==true?const Icon(Icons.star,color: Colors.yellow,) : const Icon(Icons.star_outline_outlined,color: Colors.grey,size: 35,)
                    ),
                ],
              ),
                  SizedBox(height: hieght*0.04,),
                  const Text('Write Your Reviews',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white),),
                  SizedBox(height: hieght*0.02,),
                  DottedBorder(
                      dashPattern: [8,4],
                      strokeWidth: 1.4,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      color:  Colors.grey,
                      child:TextFormField(
                        maxLines: 6,
                      )
              ),
              SizedBox(height: hieght*0.1,),
              RoundButton(
                title: 'Submit Review',
                 onTap: (){}
                )
            ],
          ),
        ),
      ),
    );
  }
}