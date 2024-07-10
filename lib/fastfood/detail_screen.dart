import 'package:Delivery_App/fastfood/payment_screen.dart';
import 'package:Delivery_App/widgets/round_button.dart';
import 'package:flutter/material.dart';

class SelectItem extends StatefulWidget {
 
 const SelectItem({super.key, required this.name, required this.image,required this.price,});
 final String name;
 final ImageProvider image;
 final int price;
  @override
  State<SelectItem> createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  int increment=1;
  int? decrement;
  int? actualPrice;
 
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    actualPrice = increment*widget.price;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        //  actions: [
        //   PersistentShoppingCart().showCartItemCountWidget(
        //     cartItemCountWidgetBuilder: (itemCount) => IconButton(
        //       onPressed: (){
        //         // Navigator.push(context, MaterialPageRoute(builder: (context) => const CartView(),));
        //       }, 
        //       icon: Badge(
        //         label: Text(itemCount.toString()),
        //         child: const Icon(Icons.shopping_bag_outlined),
        //       ),
        //       ),
        //     )
        // ],
        backgroundColor: Colors.black,
        title: const Text('ADD CART',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: height*0.04,left: width*0.03,right: width*0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(widget.name.toString(),style: const TextStyle(fontSize: 28,fontWeight: FontWeight.w600,color: Colors.white),),
              SizedBox(height: height*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star,color: Color(0xffFAC32D),),
                  SizedBox(width: width*0.01,),
                  const Text('4.8',style: TextStyle(fontSize: 15,color: Colors.white),),
                  SizedBox(width: width*0.09,),
                  const Text('50 Calories',style: TextStyle(fontSize: 15,color: Colors.white),),
                  SizedBox(width: width*0.1,),
                  const Icon(Icons.av_timer_sharp,color: Color(0xffFAC32D),),
                  SizedBox(width: width*0.01,),
                  const Text('20-30 Min',style: TextStyle(fontSize: 15,color: Colors.white),),
                ],
              ),
              SizedBox(height: height*0.05,),
              Container(
                height: height*0.3,
                width: double.infinity,
               decoration:  BoxDecoration(
                image: DecorationImage(image: widget.image),   
                borderRadius: BorderRadius.circular(41)         
               ),
              ),
              SizedBox(height: height*0.02,),
              Container(
                height: height*0.05,
                width: width*0.3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: const Color.fromARGB(255, 233, 233, 233),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        if(increment == 1){
                        }else{
                       setState(() {
                        increment= increment-1;
                       });
                        }
                      },                   
                      child: Container(
                        height: height*0.04,
                        width: width*0.1,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                         color: Colors.white,
                       ),
                       child: const Icon(Icons.remove,color: Colors.grey,),
                      ),
                    ),
                    SizedBox(width: width*0.02,),
                     Text('$increment',style: const TextStyle(fontSize: 17,color: Colors.black),),
                    SizedBox(width: width*0.02,),
                    InkWell(
                      onTap: (){
                       setState(() {
                          increment++;
                          actualPrice = increment * widget.price;
                       });
                       
                      },                  
                      child: Container(
                        height: height*0.04,
                        width: width*0.1,
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                         color: Colors.white,
                       ),
                       child: const Icon(Icons.add,color: Colors.grey,),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height*0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Details',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white),),
                  SizedBox(width: width*0.4,),
                   Text("${actualPrice!.toInt()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                ],
              ),
              SizedBox(height: height*0.04,),
              Padding(
                padding:  EdgeInsets.only(left: width*0.07),
                child: const Text('Assertively whiteboard best of breed and this a deliverables with future-proof content.',
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: Color(0xff979797)),
                ),
              ),
              SizedBox(height: height*0.04,),
              RoundButton(
                title: 'Add To Cart', 
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PaymentScreen(),));
              },
              ),
               SizedBox(height: height*0.07,),
            ],
          ),
        ),
      ),
    );
  }
}