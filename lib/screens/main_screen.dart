import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/blocs/counter_bloc.dart';
import 'package:go_router_example/navigation/extension/context_ext.dart';

class MainRoute extends GoRouteData {
  @override
  Page buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage(
      child: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MainScreen(),
      ),
    );
  }
}

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
                  child: const Text('Counter Page'),
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
