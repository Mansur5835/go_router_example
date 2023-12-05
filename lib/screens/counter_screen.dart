import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/blocs/counter_bloc.dart';
import 'package:go_router_example/navigation/extension/context_ext.dart';

class CounterRoute extends GoRouteData {
  const CounterRoute({required this.$extra});
  final CounterBloc $extra;

  static const String path = 'counter-screen';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return CupertinoPage(
        child: BlocProvider.value(
      value: $extra,
      child: const CounterScreen(),
    ));
  }
}

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('more build');
    return BlocBuilder<CounterBloc, int>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Counter Screen'),
          ),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    context.navigateTo.newCounterValue().then((value) {
                      context.read<CounterBloc>().add(CounterInk(value));
                    });
                  },
                  child: Text('Set New Value'),
                ),
                Text('$state'),
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
}

enum Info { String }
