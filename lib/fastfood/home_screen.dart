import 'dart:convert';
import 'package:Delivery_App/fastfood/CartScreen/add_to_bucket.dart';
import 'package:Delivery_App/fastfood/detail_screen.dart';
import 'package:Delivery_App/fastfood/feedback.dart';
import 'package:Delivery_App/fastfood/reviews.dart';
import 'package:Delivery_App/fastfood/track_order_screen.dart';
import 'package:Delivery_App/firebase_servicese/notification_services.dart';
import 'package:Delivery_App/ui/auth/login_screen.dart';
import 'package:Delivery_App/utils/add_data_storage.dart';
import 'package:Delivery_App/utils/slectect_lang.dart';
import 'package:Delivery_App/utils/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseMessaging.instance.getToken().then((value) {
        print('device token');
        print(value);
        // print('val---$value');
      });
    });
    notificationServices.requestNotificationPermission();
    notificationServices.FirebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.forgroundMessage();
    loadData();
  }

  String email = '';
  String password = '';
  String user_id = '';

  List images = [
    'assets/burger.png',
    'assets/chapli2.png',
    'assets/fastfood.png',
    'assets/chicken burger3.jpg',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
    'assets/burg.png',
    'assets/chicken burger3.jpg',
    'assets/chicken burger5.jpg',
  ];
  List name = [
    'Burger',
    'Chapli',
    'Fasfood',
    'Chicken',
    'Chicken Fry',
    'Egg Chap',
    'Hot Chap',
    'Burger Saled',
    'Burger Sepicy',
    'Chicken Burger',
  ];
  List price = [
    25,
    35,
    45,
    30,
    45,
    20,
    50,
    65,
    75,
    85,
  ];

  final myitems = [
    Image.asset('assets/chicken burger3.jpg'),
    Image.asset('assets/chicken burger3.jpg'),
  ];
  int myCurrentIndex = 0;
  final auth = FirebaseAuth.instance;

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password') ?? '';
    user_id = sp.getString('userId')?? '';    
  }


  Uint8List? _image;
  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  StoreData asim = StoreData();

  @override
  Widget build(BuildContext context) {
    loadData();
    var hieght = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: hieght * 0.03, left: width * 0.04),
            child: FutureBuilder(
              future: FirebaseFirestore.instance.collection('user_profile').where("email", isEqualTo: email).get(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                   return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 50,
                                backgroundImage: MemoryImage(_image!),
                              )
                            :  CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    NetworkImage(snapshot.data!.docs[0]['imageLink'])
                              ),
                        Positioned(
                          bottom: -10,
                          left: 65,
                          child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                                color: Colors.pink,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: hieght * 0.03,
                    ),
                    Text(email),
                    Divider(
                      color: Colors.grey,
                      height: hieght * 0.08,
                    ),
                    ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(Icons.location_disabled_rounded),
                      title:  Text(
                        'track_order'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TrackOrderScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(Icons.feedback_outlined),
                      title:  Text(
                        'feedback'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FeedBackScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      title:  Text(
                        'reviews'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewsScreen(),
                            ));
                      },
                    ),
                    ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(Icons.shopping_cart_outlined),
                      title:  Text(
                        'add_to_buket'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddToBucket(),
                            ));
                      },
                    ),
                    ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(Icons.logout_rounded),
                      title:  Text(
                        'log_out'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        auth.signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        }).onError((error, stackTrace) {
                          Utils().toastMessage(error.toString());
                        });
                      },
                    ),
                    ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(Icons.notifications),
                      title:  Text(
                        'notification'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                        notificationServices
                            .getDeviceToken()
                            .then((value) async {
                          var data = {
                            'to': value.toString(),
                            // 'to' : 'ciMBXs3QSZSqtuf3FgZzNu:APA91bHtnCF2EHqoN1ypf3FnKhZJpHAxyC0at6zodL_rNlG4ivWOU1PeDwJaAvX7rRD02Ls1mBP1ZXYwb0Ho6We2dk6731f8qagz_4OxptYER9WRopoCLOsMQuauhuVlu1M1lUwU6oz6'
                            'priority': 'high',
                            'notification': {
                              'title': 'Hello',
                              'body': 'spicy burger&pizza',
                            },
                            'data': {'type': 'msg', 'id': '12'}
                          };
                          await http.post(
                              Uri.parse('https://fcm.googleapis.com/fcm/send'),
                              body: jsonEncode(data),
                              headers: {
                                'Content-Type':
                                    'application/json;charset=UTF-8',
                                'Authorization':
                                    'AAAA1jmikss:APA91bHSx1DjZ64-Q-sTSGQWrVvJAP8nZhdd4gOwFhIUVrmDfzevWsUj6SASr3K59SenZgLw2z6U3dKiRCBbjB1Szkqg0v0X3dzAzfsvwSwcgn9PAz7QLRGNtmuFWGIHeT-DGWnEVO27'
                              });
                        });
                      },
                    ),
                     ListTile(
                      splashColor: Colors.pink,
                      leading: const Icon(Icons.language),
                      title:  Text(
                        'language'.tr,
                        style: const TextStyle(fontSize: 16),
                      ),
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelectLanguage(),
                            ));
                      },
                    ),
                  ],
                );
              
                }else{
                  return const Center(child: CircularProgressIndicator(color: Colors.pink,),);
                }
              
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: hieght * 0.3,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: CarouselSlider(
                    items: myitems,
                    options: CarouselOptions(
                      autoPlay: true,
                      height: hieght * 0.4,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      aspectRatio: 6.0,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 2),
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    )),
              ),
              SizedBox(
                height: hieght * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                },
                child: Container(
                  height: hieght * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.pink),
                  child: const Center(
                    child: Text(
                      'Categories',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: hieght * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Explore Menu',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'VIEW ALL',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: hieght * 0.02,
              ),
              SizedBox(
                width: width * 0.01,
              ),
              GridView.builder(
                itemCount: name.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 220,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 8),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectItem(
                            name: name[index],
                            image: AssetImage(images[index]),
                            price: price[index],
                          ),
                        ),
                      );
                    },
                    child: DottedBorder(
                      dashPattern: [8, 4],
                      strokeWidth: 1.4,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(12),
                      color: Colors.grey,
                      child: Container(
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              name[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: hieght * 0.03,
                            ),
                            CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage(images[index]),
                            ),
                            SizedBox(
                              height: hieght * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${price[index]}",
                                  style: const TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  width: width * 0.2,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 20,
                                ),
                                const Text('4.8',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: hieght * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
