import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_workshop/app/counter/counter_event.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: Center(
        child: BlocBuilder<CounterBloc, int>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                    icon: const Icon(Icons.remove),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterEvent.decrement);
                    },
                  ),
                ),
                Text(
                  '$state',
                  style: const TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    color: Theme.of(context).accentColor,
                    onPressed: () {
                      context.read<CounterBloc>().add(CounterEvent.increment);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
