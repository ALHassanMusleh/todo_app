import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/modules/counter/cubit/cubit.dart';
import 'package:todo_app/modules/counter/cubit/states.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  // int counter = 1;

  // 1. constractor
  // 2. initstate
  // 3. build

  // // حالة مبدئية
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // CounterCubit cubit = BlocProvider.of(context); //access CounterCubit
    //
    // var c = CounterCubit.get(context);
    // c.counter;
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          // if(state is CounterInitialState){
          //   print('initial state');
          // }
          if (state is CounterPlusState) {
            print('counter plus state ${state.counter}');
          }
          if (state is CounterMinusState) {
            print('counter minius state ${state.counter}');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text('Counter App'),
            ),
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   counter--;
                      //   print(counter);
                      // });

                      CounterCubit.get(context).minus();
                      print(CounterCubit.get(context).counter);
                    },
                    child: const Text('MINUS'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // setState(() {
                      //   counter++;
                      //   print(counter);
                      // });
                      CounterCubit.get(context).plus();
                      print(CounterCubit.get(context).counter);
                    },
                    child: const Text('PLUS'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class CounterScreen extends StatefulWidget {
//   const CounterScreen({super.key});
//
//   //stateless contain one class provide widget
//   //stateful contain two classes
//   //1. first class provide widget
//   //2. second class provide state from widget
//
//   @override
//   State<CounterScreen> createState() => _CounterScreenState();
// }
//
// class _CounterScreenState extends State<CounterScreen> {
//   int counter = 1;
//
//   // 1. constractor
//   // 2. initstate
//   // 3. build
//
//   // حالة مبدئية
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text('Counter App'),
//       ),
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   counter--;
//                   print(counter);
//                 });
//               },
//               child: const Text('MINUS'),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Text(
//                 '$counter',
//                 style: const TextStyle(
//                   fontSize: 50,
//                   fontWeight: FontWeight.w900,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   counter++;
//                   print(counter);
//                 });
//               },
//               child: const Text('PLUS'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
