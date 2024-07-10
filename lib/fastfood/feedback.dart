import 'package:Delivery_App/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
 
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final orderIdController = TextEditingController();
  final feedbackChannelController = TextEditingController();
  final selectFeedbackController = TextEditingController();
  final selectStoreController = TextEditingController();
  final selectDateController = TextEditingController();
  final feedbackController = TextEditingController();
   
   User? user = FirebaseAuth.instance.currentUser;

   void saveData(String name,String email,String phoneNumber,String orderid,String channel,String selectfeedback,String selectstore,String slectdate,String feedback){
         CollectionReference collRef =  FirebaseFirestore.instance.collection('feedback');
                  collRef.doc().set({
                     'Name':name,
                     'Phone Number':phoneNumber,
                     'Email':email,
                     'Order Id':orderid,
                     'Feedback Channel':channel,
                     'Select Feedback':selectfeedback,
                     'Select Store':selectstore,
                     'Select Date':slectdate,
                     'Feedback':feedback,
                  }).then((value) => {
                    Utils().toastMessage('added'),
                  });
   }

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Feedback',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(height: hieght*0.02,),
               TextFormField(
                textInputAction: TextInputAction.next,
                controller: nameController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Name',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.01,),
               TextFormField(
                textInputAction: TextInputAction.next,
                controller: phoneController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Phone Number (3xxxxxx)',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.01,),
               TextFormField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Email',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.01,),
               TextFormField(
                textInputAction: TextInputAction.next,
                controller:orderIdController ,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Order Id',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.01,),
               TextFormField(
                textInputAction: TextInputAction.next,
                controller: feedbackChannelController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Feedback Channel',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.01,),
               TextFormField(
                textInputAction: TextInputAction.next,
                controller: selectFeedbackController,
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Select Feedback Type',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.01,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 165,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: selectStoreController,
                                    decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.circle,size: 10,color: Colors.pink,),
                    enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.white)
                    ),
                    hintText: 'Select Store',
                    hintStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.white)
                    )
                    ),
                    ),
                  ),
               SizedBox(
                    width: 165,
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      controller: selectDateController,
                      decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.calendar_month,size: 30,color: Colors.pink,),
                      enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.white)
                      ),
                      hintText: 'Select Date',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Colors.white)
                      ),
                      ),
                      onTap: ()async {
                       DateTime? pickeddate = await showDatePicker(
                        context: context, 
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), 
                        lastDate: DateTime(2101).add(const Duration(days: 365)),
                        );
                        final _formateddate = DateFormat('dd-MM-yyyy').format(pickeddate!);
                             setState(() {
                            selectDateController.text = _formateddate.toString();
                          });
                     },
                    ),
                  ),
                ],
               ),
               SizedBox(height: hieght*0.02,),
               TextFormField(
                textInputAction: TextInputAction.done,
                controller: feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  enabledBorder:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  ),
                  hintText: 'Feedback',
                  hintStyle: const TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: const BorderSide(color: Colors.white)
                  )
                ),
               ),
               SizedBox(height: hieght*0.04,),
               GestureDetector(
                onTap: ()async {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));

                  saveData(
                    nameController.text, 
                    emailController.text, 
                    phoneController.text,
                    orderIdController.text,
                    feedbackChannelController.text,
                    selectFeedbackController.text,
                    selectStoreController.text,
                    selectDateController.text,
                    feedbackController.text,
                    );
                },
                 child: Container(
                  height: hieght*0.07,
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.pink
                  ),
                  child: const Center(
                    child: Text('SUBMIT',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                  ),
                 ),
               ),
               SizedBox(height: hieght*0.04,),
            ],
          ),
        ),
      ),
    );
  }
}