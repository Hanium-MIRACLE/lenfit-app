import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45,
            bottom: 0,
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CircleAvatar(),
                  Text(
                    'David',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
