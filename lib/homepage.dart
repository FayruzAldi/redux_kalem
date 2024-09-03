import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'actions/app_actions.dart';
import 'state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text(title)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${viewModel.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                ElevatedButton(
                  onPressed: viewModel.incrementCounter,
                  child: const Text('Increment'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final int counter;
  final VoidCallback incrementCounter;

  _ViewModel({
    required this.counter,
    required this.incrementCounter,
  });

  factory _ViewModel.create(Store<AppState> store) {
    return _ViewModel(
      counter: store.state.counter,
      incrementCounter: () => store.dispatch(IncrementAction()),
    );
  }
}