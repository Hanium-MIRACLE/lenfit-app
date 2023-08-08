import 'package:flutter/material.dart';

class WorkoutCardButton extends StatelessWidget {
  final int index;
  final String name;
  final String page;
  final String imageDir;
  // final Image image; = Image(const AssetImage('assets/images/dumbell.png'));

  const WorkoutCardButton({
    super.key,
    required this.index,
    required this.name,
    required this.page,
    required this.imageDir,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Theme.of(context).primaryColor,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
        ),
        onPressed: () {},
        child: Row(
          children: [
            SizedBox(
              height: 100,
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ],
              ),
            ),
            Transform.scale(
              scale: 2,
              child: Transform.translate(
                offset: const Offset(
                  30,
                  20,
                ),
                child: Image(
                  image: AssetImage(
                    imageDir,
                  ),
                  width: 120,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
