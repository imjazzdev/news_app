import 'package:flutter/material.dart';

class ItemCatagory extends StatelessWidget {
  const ItemCatagory({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: EdgeInsets.only(bottom: 30),
      padding: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.blue.shade50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Image.asset('assets/tesla.png'),
              SizedBox(
                width: 15,
              ),
              Text(title, style: TextStyle(fontSize: 22))
            ],
          ),
          Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
