import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(child: const Icon(Icons.search, color: Colors.grey,size: 28,)),
    );
  }
}
