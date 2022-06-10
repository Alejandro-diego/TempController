import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NeuButton extends StatelessWidget {
  NeuButton({Key? key, this.onTap, required this.isButtonPressed})
      : super(key: key);

  dynamic onTap;
  bool isButtonPressed;
  IconData volOff = const IconData(0xf3b9,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);
      IconData volOn = const IconData(0xf3ba,
      fontFamily: CupertinoIcons.iconFont,
      fontPackage: CupertinoIcons.iconFontPackage);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: 55.0,
        width: 55.0,
        child: Icon(
         isButtonPressed? volOn :volOff,
          size: isButtonPressed ? 30 : 27,
          color: isButtonPressed ? Colors.green : Colors.grey[800],
        ),
        decoration: BoxDecoration(
          border: Border.all(
              color: isButtonPressed
                  ? const Color.fromARGB(255, 49, 45, 45)
                  : Colors.grey.shade900),
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(12),
          boxShadow: isButtonPressed
              ? []
              : [
                  BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(6, 6),
                    blurRadius: 15.0,
                    spreadRadius: 1.0,
                  ),
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(-6, -6),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
        ),
      ),
    );
  }
}
