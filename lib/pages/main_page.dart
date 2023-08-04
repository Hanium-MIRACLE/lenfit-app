import 'package:flutter/material.dart';
import 'package:lenfit/widgets/workout_record_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "eunbin";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45,
            bottom: 0,
            left: 20,
            right: 20,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hello, $name.',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
              const WorkoutRecordCard(
                name: 'Squat',
                score: 90,
                time: 1500,
                count: 54,
                tempo: 60,
                date: "2023-06-29",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
