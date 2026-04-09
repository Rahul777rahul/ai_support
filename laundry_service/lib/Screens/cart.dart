import 'package:flutter/material.dart';
//import 'package:laundry_service/a.dart';
import 'package:provider/provider.dart'; 
import 'package:laundry_service/Screens/home.dart';
import 'package:laundry_service/provider/cart_provider.dart'; 
//import 'package:laundry_service/Screens/slot_picker_sheet.dart'; 

class Carta extends StatefulWidget {
  const Carta({super.key}); 

  @override
  State<Carta> createState() => _CartState();
}

class _CartState extends State<Carta> {
  
  bool slotConfirmed = false;
  String selectedAddress = "Home - Indeevaram Building, Koratty Infopark";
  String selectedDate = "Mon - March 18";
  String selectedTime = "10:00 PM";

  @override
  Widget build(BuildContext context) {
    
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Your Cart", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Basket", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Column(
                    
                    children: cart.items
                        .where((item) => item['count'] > 0)
                        .map((item) {
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              "${item['name']} x ${item['count']}",
                              style: TextStyle(fontSize: 15),
                            ),
                            trailing: Text(
                              "₹${item['price'] * item['count']}",
                              style: TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    }).toList(),
                  ),
                  Text("What do you need your Delivery?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _deliveryOption(context, "3 Days", "(Free)", 0, cart),
                      _deliveryOption(context, "2 Days", "(+₹50)", 50, cart),
                      _deliveryOption(context, "1 Days", "(+₹70)", 70, cart),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 600,
              decoration: BoxDecoration(color: Color.fromARGB(255, 210, 168, 110)),
              child: Center(
                child: ListTile(
                  title: Text("Coupons and offers", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                  leading: Icon(Icons.money_off_csred_sharp, color: Color.fromARGB(255, 82, 67, 44)),
                  trailing: TextButton(onPressed: () {}, child: Text("4 offers >", style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 82, 67, 44)))),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Summary", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  ListTile(
                    title: Text("Item Total"),
                    trailing: Text("₹${cart.itemTotal}"), 
                  ),
                  ListTile(
                    title: Text("Taxes '₹20' and Fee "),
                    trailing: Text("₹${cart.taxFee + cart.deliveryCharge}"), 
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Total Amount to Pay", style: TextStyle(color: Color.fromARGB(255, 210, 168, 110))),
                    trailing: Text("₹${cart.totalAmount}", style: TextStyle(fontSize: 17,color: Color.fromARGB(255, 210, 168, 110))), 
                  ),
                  SizedBox(height: 30),
                  Text("Cancellation Policy", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  SizedBox(height: 10),
                  Text("Free cancellation if done more than 2 hrs before the service or delivery agent is arrived. A fee will be charges otherwise", style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5),
                  TextButton(onPressed: () {}, child: Text("Read full policy", style: TextStyle(color: Color.fromARGB(255, 210, 168, 110)))),
                  SizedBox(height: 20),
                  Text("Add a tip to the Professional", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _tipOption("₹50"),
                      _tipOption("₹70"),
                      _tipOption("₹100"),
                      _tipOption("custom"),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text("100% of the tip goes to the Professional", style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5),
                ],
              ),
            ),
            buildBottomCartBar(cart), 
          ],
        ),
      ),
    );
  }

  
  Widget _deliveryOption(BuildContext context, String title, String sub, int charge, CartProvider cart) {
    bool isSelected = cart.deliveryCharge == charge;
    return GestureDetector(
      onTap: () => cart.setDelivery(charge),
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: isSelected ? Color.fromARGB(255, 210, 168, 110) : Colors.grey.withOpacity(0.2), width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            SizedBox(height: 4),
            Text(sub, style: TextStyle(fontSize: 10, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _tipOption(String label) {
    return Container(
      width: 55,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1.5),
      ),
      child: Center(child: Text(label, style: TextStyle(fontSize: 10, color: Colors.black54))),
    );
  }

  Widget buildBottomCartBar(CartProvider cart) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
      ),
      child: slotConfirmed
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(leading: Icon(Icons.house_sharp), title: Text(selectedAddress, style: TextStyle(fontSize: 13)), trailing: Icon(Icons.more_vert)),
                ListTile(leading: Icon(Icons.access_time_filled), title: Text("$selectedDate - $selectedTime", style: TextStyle(fontSize: 13)), trailing: Icon(Icons.more_vert)),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 210, 168, 110),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()), (Route<dynamic> route) => false);
                      
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order placed successfully")));
                    },
                    child: Text("Proceed to Pay", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            )
          : SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 210, 168, 110),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 345,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(title: Text("Saved Address"), trailing: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.cancel))),
                            TextButton(onPressed: () {}, child: Text("+ Add another address", style: TextStyle(color: Colors.black))),
                            Divider(),
                            ListTile(
                              leading: Radio(activeColor: Colors.black, value: 1, groupValue: 1, onChanged: (v) {}),
                              title: Text("Home"),
                              subtitle: Text("Indeevaram building, koratty infopark, india ph:+91 123456791", style: TextStyle(fontSize: 10)),
                              trailing: IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 210, 168, 110),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                                ),
                                child: const Text("Proceed to Check out", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                                onPressed: () async {
                                  Navigator.pop(context);
                                  var result = await showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                                    builder: (context) => const SlotPickerSheet(),
                                  );

                                  if (result != null) {
                                    List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu"];
                                    setState(() {
                                      slotConfirmed = true;
                                      selectedTime = result["time"];
                                      selectedDate = "${days[result["date"]]} - Mar ${11 + result["date"]}";
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text("Add Address & Slot", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
    );
  }
}
class SlotPickerSheet extends StatefulWidget {
  const SlotPickerSheet({super.key});

  @override
  State<SlotPickerSheet> createState() => _SlotPickerSheetState();
}

class _SlotPickerSheetState extends State<SlotPickerSheet> {
  int selectedDateIndex = 0;
  String selectedTime = "10:00 AM";

  final List<String> timeSlots = [
   
    "10:00 AM", "10:30 AM", "11:00 AM", "11:30 AM",
    "12:00 PM", "12:30 PM", "01:00 PM", "01:30 PM",
    "02:00 PM", "02:30 PM", "03:00 PM", "03:30 PM",
    "04:00 PM", "04:30 PM", "05:00 PM", "05:30 PM",
    
  ];

  @override
  Widget build(BuildContext context) {
    const Color themeColor = Color.fromARGB(255, 210, 168, 110);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("When should the Order Pick?",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 15),

          
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => _buildDateTile(index, themeColor),
            ),
          ),
          const SizedBox(height: 25),

          const Text("When should the Order Pick?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),

          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(), 
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 2.2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemCount: timeSlots.length,
            itemBuilder: (context, index) => _buildTimeTile(timeSlots[index], themeColor),
          ),
          const SizedBox(height: 30),

          
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                
                
Navigator.pop(context, {
  "date": selectedDateIndex,
  "time": selectedTime,
});

              },
              child: const Text("Proceed to Check out",
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildDateTile(int index, Color themeColor) {
    bool isSelected = selectedDateIndex == index;
    List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu"];
    return GestureDetector(
      onTap: () => setState(() => selectedDateIndex = index),
      child: Container(
        width: 70,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: isSelected ? themeColor : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(days[index], style: TextStyle(color: isSelected ? themeColor : Colors.black54)),
            Text("${11 + index}", 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ],
        ),
      ),
    );
  }

  
  Widget _buildTimeTile(String time, Color themeColor) {
    bool isSelected = selectedTime == time;
    return GestureDetector(
      onTap: () => setState(() => selectedTime = time),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? themeColor : Colors.white,
          border: Border.all(color: isSelected ? themeColor : Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(time, 
          style: TextStyle(
            fontSize: 12, 
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          )),
      ),
    );
  }
}