import 'package:flutter/material.dart';
//import 'package:laundry_service/a.dart';
import 'package:provider/provider.dart';
import 'package:laundry_service/provider/cart_provider.dart';
import 'package:laundry_service/Screens/cart.dart';

class WashAndFold extends StatelessWidget {
  const WashAndFold({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<CartProvider>(context);

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            "Wash & Fold",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            indicatorColor: const Color.fromARGB(255, 210, 168, 110),
            indicatorWeight: 3,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              buildTab("Top", "5 items"),
              buildTab("Bottoms", "0 items"),
              buildTab("Undergarments", "0 items"),
              buildTab("Formals", "0 items"),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  _buildItemList(context),
                  const Center(child: Text("Bottoms Page")),
                  const Center(child: Text("Undergarments Page")),
                  const Center(child: Text("Formals Page")),
                ],
              ),
            ),
            buildBottomCartBar(context),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String label, String sub) {
    return Tab(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildItemList(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: cart.items.length,
      separatorBuilder: (context, index) => const Divider(height: 30),
      itemBuilder: (context, index) {
        final item = cart.items[index];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
                Text("₹${item['price']}/piece",
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
            _buildAddButton(context, index),
          ],
        );
      },
    );
  }

  Widget _buildAddButton(BuildContext context, int index) {
    final cart = Provider.of<CartProvider>(context);
    int count = cart.items[index]['count'];
    Color themeColor = const Color.fromARGB(255, 210, 168, 110);

    return Container(
      height: 32,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: themeColor.withOpacity(0.5)),
      ),
      child: count == 0
          ? InkWell(
              onTap: () => cart.addItem(index),
              borderRadius: BorderRadius.circular(20),
              child: Center(
                child: Text("Add",
                    style: TextStyle(
                        color: themeColor, fontWeight: FontWeight.bold)),
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => cart.removeItem(index),
                    child: Icon(Icons.remove, size: 16, color: themeColor),
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () => cart.addItem(index),
                    child: Icon(Icons.add, size: 16, color: themeColor),
                  ),
                ),
              ],
            ),
    );
  }

  Widget buildBottomCartBar(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${cart.totalItems} items",
                  style: const TextStyle(color: Colors.grey)),
              Text(
                "Total ₹ ${cart.totalPrice}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 210, 168, 110),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: cart.totalItems > 0 
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Carta()),
                    );
                  } 
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 210, 168, 110),
              minimumSize: const Size(170, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
            ),
            child: const Text("Go to cart",
                style: TextStyle(color: Colors.white, fontSize: 16)),
          )
        ],
      ),
    );
  }
}