import 'package:flutter/material.dart';
import 'package:laundry_service/Screens/washandfold.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
  mainAxisSize: MainAxisSize.min, 
  children: [
    
    NavigationBar(
      shadowColor: Colors.black,
      surfaceTintColor: Colors.black,
      indicatorColor: Color.fromARGB(255, 210, 168, 110),
      backgroundColor: Colors.white,
      elevation: 0,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.house_sharp), label: "Home"),
        NavigationDestination(icon: Icon(Icons.card_travel), label: "Order"),
        NavigationDestination(icon: Icon(Icons.card_giftcard), label: "Plans"),
        NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
      ],
    ),
  ],
),
      appBar: AppBar(
        
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.location_on,color: Color.fromARGB(255, 210, 168, 110),),
                  Text("Hometown",style: TextStyle(fontSize: 20),),
                  Icon(Icons.arrow_downward_outlined)
                ],
              ),
              Text("Indeevaram Building, Koratty",style: TextStyle(fontSize: 10,color: Colors.grey),)
            ],
          ),

          
        ],
      ),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart)),
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications)),
      ],
      ),
      body: Padding(padding: EdgeInsets.all(10),
       child: SingleChildScrollView(
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            Text("Hey Rahul!",style: TextStyle(fontSize: 15,color: const Color.fromARGB(255, 6, 157, 132))),
            SizedBox(height: 5),
            Text("What would you like to wash today?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>WashAndFold())),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color.fromARGB(255, 177, 255, 218),
                        child: Lottie.asset("asset/Washing Machine.json"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Wash & Fold",style: TextStyle(fontSize: 11))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color.fromARGB(255, 203, 255, 255),
                        child: Lottie.asset("asset/Ironing Boy.json"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Wash & Iron",style: TextStyle(fontSize: 11))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color.fromARGB(255, 237, 155, 251),
                        child: Lottie.asset("asset/Dress.json"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Dry Cleaning",style: TextStyle(fontSize: 11))
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color.fromARGB(255, 248, 196, 196),
                        child: Lottie.asset("asset/Bathing time.json"),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Bed & Bath",style: TextStyle(fontSize: 11),)
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Center(
        child: Container(
          width: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // color:  Color.fromARGB(255, 210, 168, 110),
            image: DecorationImage(image: AssetImage("asset/img1.jpg"),
            fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Get ₹100 off on your',
                  style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                Text(
                  'First Order',
                  style: TextStyle(fontSize: 18.0,color: Colors.white,fontWeight: FontWeight.bold),
                ),
                Text(
                  'on your order above ₹299 ',
                  style: TextStyle(fontSize: 15.0,color: Colors.white),
                ),
                SizedBox(height: 8.0), 
                TextButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white
                    
                  ),
                  child:  Text('Order Now',style: TextStyle(color: Colors.black),),
                  onPressed: () {
                    
                  },
                ),
              ],
            ),
          ),
        ),
            ),
            SizedBox(height: 20,),
            Text("Special Services",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    
                    CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyft_3W61HqoSpM-_DdL6KYKIoj-Hn81_hTA&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Stain",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJhJUrCul4EcUwC7ZQVrr5fIgms1mJs6LcKg&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Blankets",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSIoTO8RDBpzThQzytk4XGgoyX3046sUkQCA&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Jackets",style: TextStyle(fontSize: 12))
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxRByfc64z2nLFz6k7WiD3BTRUcGpYRAjSPQ&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("HandWash",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbevaHI8uKRd7DO1_fv_Wtw5M6ZJLw-bcELQ&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Home Items",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5DCa7ZDjfTrVa6db84OzDkvP4KXtO_LFqFZoap7ARmQ&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("BabyWear",style: TextStyle(fontSize: 12))

                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy0sLAUrOUEoTasarkXaHkwShccyG_Mkxdeg&s")
                          ),
                        SizedBox(height: 5,),
                        Text("Ironing",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqZcSVPbKiJVCgafITijiB3zscsH1XFVr0uw&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Ethnic Wears",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy0sLAUrOUEoTasarkXaHkwShccyG_Mkxdeg&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Eco-Friendly",style: TextStyle(fontSize: 12)),
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyKMcsviGV9vzLY7qjpxmtBSz7yiPvEU1b3A&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Shoes",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJl7jXUTGfNSaiNSZu77p1aIoZk3wcsAOPyg&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Bags",style: TextStyle(fontSize: 12)),
                        SizedBox(height: 10,),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 213, 237, 248),
                          backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhoxEf6AVJA3Fo6gH2dVm0bNLtPMefltztoA&s"),
                        ),
                        SizedBox(height: 5,),
                        Text("Special Care",style: TextStyle(fontSize: 12))

                  ],
                )
              ],
            ),


          ],
         ),
       ),
      ),
    );
  }
}