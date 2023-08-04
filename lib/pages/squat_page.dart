import 'package:flutter/material.dart';
import 'package:lenfit/pages/lens_page.dart';

class SquatPage extends StatefulWidget {
  const SquatPage({super.key});

  @override
  State<SquatPage> createState() => _SquatPageState();
}

class _SquatPageState extends State<SquatPage> {
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
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Squat Page',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Text(
                  'Model',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {},
                    child: const Text('Start'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LensPage()),
                      );
                    },
                    child: const Text('Done'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
