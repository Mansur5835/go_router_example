import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NewCounterValuePage extends StatefulWidget {
  const NewCounterValuePage({super.key});
  static const String path = '/new-counter-value-route';

  @override
  State<NewCounterValuePage> createState() => _NewCounterValuePageState();
}

class _NewCounterValuePageState extends State<NewCounterValuePage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Counter Value Page'),
        ),
        body: Center(
          child: Column(children: [
            TextButton(
                onPressed: () {
                  context.pop(value);
                },
                child: Text('Ok')),
            Text('$value'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(
                  onPressed: () {
                    value++;
                    setState(() {});
                  },
                  child: Text('+'),
                ),
                const SizedBox(
                  width: 20,
                ),
                FilledButton(
                  onPressed: () {
                    value--;
                    setState(() {});
                  },
                  child: Text('-'),
                ),
              ],
            ),
          ]),
        ));
  }
}
