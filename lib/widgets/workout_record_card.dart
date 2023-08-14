import 'package:flutter/material.dart';
import 'package:lenfit/utils/colors.dart';

class WorkoutRecordCard extends StatelessWidget {
  final String name;
  final double score;
  final int time;
  final int count;
  final int tempo;
  final String date;

  const WorkoutRecordCard({
    super.key,
    required this.name,
    required this.score,
    required this.time,
    required this.count,
    required this.tempo,
    required this.date,
  });

  Widget exerciseTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Azonix',
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }

  String secToMin(int seconds) {
    int sec = seconds % 60;
    int min = (seconds / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute:$second";
  }

  Widget scoreItem(double score) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          score.toString(),
          style: const TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Text(
          '/100',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget item(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget dateItem(String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        date,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 16,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: cPrimaryColor,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
          elevation: 5,
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                exerciseTitle(name),
                scoreItem(score),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  dateItem(date),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      item('tempo', '$tempo'),
                      item('count', '$count'),
                      item('time', secToMin(time)),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
