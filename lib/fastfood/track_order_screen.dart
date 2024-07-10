import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
 
  final Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.6844, 73.0479),
    zoom: 14.0,
    );

    List<Marker> _marker = [];
  // List<Marker> _list = [
  //   Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(33.6844, 73.0479),
  //     infoWindow: InfoWindow(
  //       title: 'My Position',
  //     ),
  //   ),
  //    Marker(
  //     markerId: MarkerId('1'),
  //     position: LatLng(33.6844, 73.0479),
  //     infoWindow: InfoWindow(
  //       title: 'My Current Position',
  //     ),
  //   ),
  //];

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
       appBar: AppBar(
        actions: [
         Padding(
           padding:  EdgeInsets.only(right:width*0.09 ),
           child: const Icon(Icons.my_location_sharp,color: Colors.black,),
         )
        ],
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Track Order',style: TextStyle(color: Colors.pink,fontWeight: FontWeight.bold),),
        centerTitle: true,
       
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: width*0.03,right: width*0.03),
          child: Column(
            children: [
              SizedBox(
                height: height*0.3,
                child: GoogleMap(
                  initialCameraPosition: _kGooglePlex,
                   mapType: MapType.normal,
                    myLocationEnabled: false,
                    compassEnabled: false,
                    markers: Set<Marker>.of(_marker),
                    onMapCreated: ( GoogleMapController controller) {
                     _controller.complete(controller);
                    },
                  ),
              ),
              Container(
                margin: EdgeInsets.only(left: width*0.04),
                height: height*0.2,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(31),
                ),
                child: Row(
                  children: [
                    Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text('Order code   ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            SizedBox(width: width*0.1,),
                            const Text('25A36V3 ',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                        SizedBox(height: height*0.03,),
                         Row(
                          children: [
                            const Text('Delivery time',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                            SizedBox(width: width*0.09,),
                            const Text('20-40 Min',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                          ],
                        ),
                      ],
                    ),
                          SizedBox(width: width*0.07,),
                            Container(
                            height: height*0.1,
                            width: width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color:  Colors.pink
                            ),
                            child: const Icon(Icons.border_color_sharp,color: Colors.white,size: 25,),
                          ),
                           ],
                       ),
                      ),
                        SizedBox(height: height*0.03,),
                          Container(
                            height: height*0.2,
                            width: width*0.9,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color:  Colors.pink,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                             const CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/splash.png'),
                             ),
                          SizedBox(width: width*0.04,),
                          SizedBox(
                            height: double.infinity,
                            width: width*0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Brooklyn Simmons',style: TextStyle(fontWeight: FontWeight.w600),),
                                SizedBox(height: height*0.02,),
                                const Text('Food Courier',style: TextStyle(),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: height*0.03),
                            height: height*0.1,
                            width: width*0.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                              color:  Colors.grey,
                            ),
                            child: const Icon(Icons.phone_in_talk_sharp,color: Colors.white,size: 40,),
                          ),
                              ],
                            ),
                          ),
                            SizedBox(width: width*0.2,),
                             ],
                    ),
        ),
                 ),
          );
  }
}






