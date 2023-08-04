import 'package:flutter/material.dart';
import 'package:lenfit/widgets/workout_card_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LensPage extends StatefulWidget {
  const LensPage({super.key});

  @override
  State<LensPage> createState() => _LensPageState();
}

class _LensPageState extends State<LensPage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final workout = ['Squat', 'Push up', 'Pull up'];

  @override
  Widget build(BuildContext context) {
    final pages = [
      const WorkoutCardButton(
        index: 0,
        name: "Squat",
        page: 'none',
        imageDir: 'assets/images/dumbell.png',
      ),
      const WorkoutCardButton(
        index: 1,
        name: "Pull up",
        page: 'none',
        imageDir: 'assets/images/kettlebell.png',
      ),
      const WorkoutCardButton(
        index: 2,
        name: "Push up",
        page: 'none',
        imageDir: 'assets/images/bottle.png',
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 200),
              SizedBox(
                height: 240,
                child: PageView.builder(
                  controller: controller,
                  // itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 12),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  type: WormType.thinUnderground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
