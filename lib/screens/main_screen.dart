import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router_example/blocs/counter_bloc.dart';
import 'package:go_router_example/navigation/extension/context_ext.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String path = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Main Screen'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  child: const Text('Go to Counter'),
                  onPressed: () {
                    context.navigateTo.counterPage();
                  },
                ),
                Text(
                  '$state',
                  style: const TextStyle(fontSize: 20),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FilledButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterInk(null));
                      },
                      child: Text('+'),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    FilledButton(
                      onPressed: () {
                        context.read<CounterBloc>().add(CounterDec());
                      },
                      child: Text('-'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('MainScreen dispose');
  }
}
