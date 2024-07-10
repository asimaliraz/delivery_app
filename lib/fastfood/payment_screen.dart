import 'package:Delivery_App/fastfood/track_order_screen.dart';
import 'package:Delivery_App/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Payment',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        centerTitle: true,
       
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: height*0.04,left: width*0.03,right: width*0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Payment methods',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
              SizedBox(height: height*0.04,),
              Container(
                height: height*0.08,
                width: width*0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.pink
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.payment_outlined,color: Colors.white,),
                    SizedBox(width: width*0.04,),
                    const Text('Pay With Visa or Mastercard',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),),
                  ],
                ),
              ),
              SizedBox(height: height*0.02,),
                    const Center(child: Text('Choose another payment type',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)),
                 SizedBox(height: height*0.03,),
                 Row(
                  children: [
                     Container(
                               height: height*0.06,
                               width: 90,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color:  Colors.pink,
                             ),
                             child:Row(
                              children: [
                                 const Icon(Icons.paypal,color: Color(0xff283593),size: 30,),
                                 SizedBox(width: width*0.01,),
                                const Text('pay',style: TextStyle(fontSize: 16,color: Colors.white),),
                              ],
                             ),
                      ),
                       SizedBox(width: width*0.07,),
                       Container(
                                 height: height*0.06,
                                 width: 90,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color:  Colors.pink,
                             ),
                             child:Row(
                              children: [
                                 const Icon(Icons.apple,color: Colors.black,size: 30,),
                                 SizedBox(width: width*0.01,),
                                 const Text('pay',style: TextStyle(fontSize: 16),),
                              ],
                             ),
                      ),
                      SizedBox(width: width*0.07,),
                       Container(
                                 height: height*0.06,
                                 width: 90,
                               decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(5),
                               color:  Colors.pink,
                             ),
                             child:Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Image(image: const AssetImage('assets/goggle.png'),height: height*0.03,width: width*0.07,fit: BoxFit.fitHeight,),
                                 SizedBox(width: width*0.01,),
                                 const Text('pay',style: TextStyle(fontSize: 16),),
                              ],
                             ),
                      ),
                  ],
                 ),
                 SizedBox(height: height*0.03,),
                 const Text('Card number',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                 SizedBox(height: height*0.01,),
                 TextFormField(
                  controller: cardNumberController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: '****     ****     ****     7911',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                 ),
                 SizedBox(height: height*0.02,),
                 Row(
                  children: [
                    const Text('Expiry date',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(width: width*0.3,),
                    const Text('CVV',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                  ],
                 ),
                 SizedBox(height: height*0.01,),
                 Row(
                  children: [
                    Container(
                      height: height*0.1,
                      width: 140,
                  margin: EdgeInsets.only(right: width*0.1),
                   child: TextFormField(
                    controller: dateController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: 'MM/YYYY',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    onTap: ()async {
                      DateTime? pickeddate = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), 
                        lastDate: DateTime(2101).add(const Duration(days: 365)),
                        );
                        final _formateddate = DateFormat('MM-yyyy').format(pickeddate!);
                             setState(() {
                            dateController.text = _formateddate.toString();
                          });
                    },
                   ),
                 ),
                  SizedBox(width: width*0.05,),
                 Container(
                      height: height*0.1,
                      width: 140,
                  margin: EdgeInsets.only(right: width*0.009),
                   child: TextFormField(
                    controller: cvvController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: '****',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                   ),
                 ),
                  ],
                 ),
                 SizedBox(height: height*0.001,),
                 const Text('Card holder name',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                 SizedBox(height: height*0.01,),
                 TextFormField(
                  controller: cardHolderController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: 'Aftabul Islam Samudro',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                 ),
                 SizedBox(height: height*0.02,),
                 Row(
                  children: [
                    const Text('Save card information      ',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                    SizedBox(width: width*0.1,),
                    Container(
                      height: height*0.04,
                      width: width*0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.pink
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('    Save',style: TextStyle( color: Colors.white,),),
                          Container(
                            height: height*0.04,
                            width: width*0.09,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(29),
                              color: Colors.white,
                            ),
                            child: const Icon(Icons.done,size: 20,color: Colors.pink,),
                          ),
                        ],
                      ),
                    ),
                  ],
                 ),
                 Padding(
                   padding:  EdgeInsets.only(right: width*0.09),
                   child: Divider(height: height*0.1,color: Colors.grey,),
                 ),
                 SizedBox(height: height*0.01,),
                 Row(
                  children: [
                    const Text('Total -',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    SizedBox(width: width*0.6,),
                    const Text('\$152.00',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                  ],
                 ),
                 SizedBox(height: height*0.04,),
               RoundButton(
                title: 'Pay Now', 
               onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrderScreen(),));
               },
               ),
                 SizedBox(height: height*0.03,),
            ],
          ),
        ),
      ),
    );
  }
}