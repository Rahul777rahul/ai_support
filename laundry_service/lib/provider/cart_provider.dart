import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  List<Map<String, dynamic>> items = [
    {"name": "Shirt", "price": 40, "count": 0},
    {"name": "T-Shirt", "price": 40, "count": 0},
    {"name": "Blouse", "price": 40, "count": 0},
    {"name": "Sweatshirt / Hoodie", "price": 40, "count": 0},
    {"name": "Vest / Tank top", "price": 40, "count": 0},
  ];

  int deliveryCharge = 0;
  int taxFee = 20;

  bool slotConfirmed = false;

  String selectedAddress = "Home - Indeevaram Building, Koratty Infopark";
  String selectedDate = "Mon - March 18";
  String selectedTime = "10:00 PM";

  int get totalItems {
    int total = 0;
    for (var item in items) {
      total += item['count'] as int;
    }
    return total;
  }

  int get totalPrice {
    int total = 0;
    for (var item in items) {
      total += (item['count'] as int) * (item['price'] as int);
    }
    return total;
  }

  int get itemTotal {
    int total = 0;
    for (var item in items) {
      total += (item['price'] as int) * (item['count'] as int);
    }
    return total;
  }

  int get totalAmount {
    return itemTotal + taxFee + deliveryCharge;
  }

  void addItem(int index) {
    items[index]['count']++;
    notifyListeners();
  }

  void removeItem(int index) {
    if (items[index]['count'] > 0) {
      items[index]['count']--;
      notifyListeners();
    }
  }

  void setDelivery(int charge) {
    deliveryCharge = charge;
    notifyListeners();
  }

  void confirmSlot(String date, String time) {
    slotConfirmed = true;
    selectedDate = date;
    selectedTime = time;
    notifyListeners();
  }
}