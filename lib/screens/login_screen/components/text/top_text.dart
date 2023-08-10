import 'package:flutter/material.dart';

// class TopText extends StatelessWidget {
//   final Screens screen;
//   const TopText({super.key, required this.screen});

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       screen == Screens.createAccount ? 'Create\nAccount' : 'Welcome\nBack',
//       style: const TextStyle(
//         fontSize: 40,
//         fontWeight: FontWeight.w600,
//         color: Colors.black,
//       ),
//     );
//   }
// }

class TopText extends StatelessWidget {
  final String title;
  const TopText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.bold,
              fontFamily: 'Azonix',
            ),
          ),
        ],
      ),
    );
  }
}
