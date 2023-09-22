import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // main axis alignment  default  : start
  // cross axis alignment default : center

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text('Hello '),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print('Hello');
            },
            icon: const Icon(Icons.notification_add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'First',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Second',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Third',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Forth',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'First',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Second',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Third',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Forth',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'First',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Second',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Third',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Forth',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'First',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Second',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Third',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Forth',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'First',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Second',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Third',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Forth',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'First',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Second',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Third',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              Text(
                'Forth',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Row Widget
// body: Container(
// color: Colors.deepPurple,
// height: double.infinity,
// child: Row(
// mainAxisSize: MainAxisSize.max,
// // mainAxisAlignment: MainAxisAlignment.start,
// // crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Container(
// color: Colors.red,
// child: Text(
// 'First',
// style: TextStyle(fontSize: 20, color: Colors.white),
// ),
// ),
// // Container(
// //   color: Colors.green,
// //   child: Text(
// //     'Second',
// //     style: TextStyle(fontSize: 20, color: Colors.white),
// //   ),
// // ),
// // Container(
// //   color: Colors.amberAccent,
// //   child: Text(
// //     'Third',
// //     style: TextStyle(fontSize: 20, color: Colors.white),
// //   ),
// // ),
// // Container(
// //   color: Colors.blue,
// //   child: Text(
// //     'Forth',
// //     style: TextStyle(fontSize: 20, color: Colors.white),
// //   ),
// // ),
// ],
// ),
// ),

//Column  Widget
// body: Container(
// color: Colors.purpleAccent,
// width: double.infinity,
// child: Column(
// mainAxisSize: MainAxisSize.max,
// // mainAxisAlignment: MainAxisAlignment.start,
// // crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: [
// Container(
// color: Colors.red,
// child: Text(
// 'First Text',
// style: TextStyle(
// color: Colors.white,
// fontSize: 30,
// ),
// ),
// ),
// // Container(
// //   color: Colors.green,
// //   child: Text(
// //     'Second Text',
// //     style: TextStyle(
// //       color: Colors.white,
// //       fontSize: 30,
// //     ),
// //   ),
// // ),
// // Container(
// //   color: Colors.amber,
// //   child: Text(
// //     'Third Text',
// //     style: TextStyle(
// //       color: Colors.white,
// //       fontSize: 30,
// //     ),
// //   ),
// // ),
// // Container(
// //   color: Colors.blue,
// //   child: Text(
// //     'Forth Text',
// //     style: TextStyle(
// //       color: Colors.white,
// //       fontSize: 30,
// //     ),
// //   ),
// // ),
// ],
// ),
// ),

//Expandend Widget
// body: Column(
//   children: [
//     // 3 + 1 + 1 + 1 = 6 //divide screen to 6
//     Expanded(
//       flex: 3,
//       child: Container(
//         color: Colors.red,
//         child: Text(
//           'First Text',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: Container(
//         color: Colors.green,
//         child: Text(
//           'Second Text',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: Container(
//         color: Colors.amber,
//         child: Text(
//           'Third Text',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//           ),
//         ),
//       ),
//     ),
//     Expanded(
//       child: Container(
//         color: Colors.blue,
//         child: Text(
//           'Forth Text',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 30,
//           ),
//         ),
//       ),
//     ),
//   ],
// ),
// body: SafeArea(
//   child: Text('HELLO'),
// ),
