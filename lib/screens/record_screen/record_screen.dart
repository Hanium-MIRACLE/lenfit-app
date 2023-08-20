import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lenfit/model/login.dart';
import 'package:lenfit/model/workdout_record.dart';
import 'package:lenfit/widgets/workout_record_card.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  List<dynamic>? records = [];
  // late List<WorkoutRecordCard> recordCards;

  Future<List<dynamic>?> getRecords() async {
    Login loginInfo = Provider.of<Login>(context, listen: false);
    try {
      http.Response response = await http.get(
        Uri.parse("https://api.staging.lenfitapp.com/api/record/records/"),
        headers: {
          "Authorization": "TOKEN " + loginInfo.token!,
        },
      );
      if (response.statusCode == 200) {
        json.decode(response.body).forEach(
          (record) {
            records!.add(WorkoutRecord.fromJson(json: record));
          },
        );
        setState(() {});
        return records;
      } else {
        return null;
      }
    } catch (error) {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getRecords();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (records != null) {
      print(records.runtimeType);
      print(records!.length);
      // print("record: " + records![0].toString());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 48,
        horizontal: 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Records',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: records != null
                  ? [
                      for (var record in records!)
                        WorkoutRecordCard(
                          score: record.score,
                          name: record.name,
                          count: record.count,
                          calories: record.calories,
                          time: 1500,
                          date: record.date,
                        ),
                    ]
                  : [Text('nullnullnullnullnullnullnullnullnull')],
            ),
          ],
        ),
      ),
    );
  }
}
