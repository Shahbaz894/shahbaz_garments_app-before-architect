// import 'package:flutter/material.dart';
//
// class googleSignInButton extends StatelessWidget {
//   final Function() onPressed;
//
//   googleSignInButton({required this.onPressed});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: 57,
//         width: 147,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           color: Colors.white54,
//           border: Border.all(color: Colors.black12),
//         ),
//         child: Expanded(
//           child: Row( // Use Row as the parent widget here
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/google.png', // Provide the correct asset path
//                 width: 39,
//                 height: 38,
//               ),
//               SizedBox(width: 5),
//               Text(
//                 'Google',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class googleSignInButton extends StatelessWidget {
  final Function() onPressed;

  googleSignInButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 57,
        width: 147,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white54,
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/google.png', // Provide the correct asset path
              width: 39,
              height: 38,
            ),
            SizedBox(width: 5),
            Text(
              'Google',
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
