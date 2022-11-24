import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 34,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 238, 238, 238),
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search products...",
          hintStyle: TextStyle(fontSize: 13.5),
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.only(left: 15, top: 5),
        ),
      ),
    );
  }
}