import 'package:flutter/material.dart';

class facebookSignInButton extends StatelessWidget {
  final Function() onPressed;

  facebookSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 57,
        width: 147,
        //color: Colors.grey,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white54,
          border: Border.all(color: Colors.black12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/facebook.png', // Provide the correct asset path
              width: 39,
              height: 38,
            ),
            const SizedBox(width: 5),
            Text(
              'Facebook',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
