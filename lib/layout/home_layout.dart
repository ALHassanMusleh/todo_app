import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/modules/archived_tasks/archived_task_screen.dart';
import 'package:todo_app/modules/done_tasks/done_task_screen.dart';
import 'package:todo_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:todo_app/shared/component/components.dart';
import 'package:todo_app/shared/component/constants.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  // int currentIndex = 0;

  // Database? database;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  // bool isBottomSheetShown = false;
  // IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var autoValidateMode = AutovalidateMode.disabled;

  // List<Widget> screens = const [
  //   NewTasksScreen(),
  //   DoneTasksScreen(),
  //   ArchivedTasksScreen(),
  // ];
  //
  // List<String> screensTitle = const [
  //   'New Tasks',
  //   'Done Tasks',
  //   'Archived Tasks',
  // ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                cubit.screensTitle[cubit.currentIndex],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            // body: tasks.length == 0
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     : screens[currentIndex],
            body: ConditionalBuilder(
              // condition: tasks.length > 0,
              condition: state is! AppGetDatabaseLoadingState,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // try {
                //   var name = await getName();
                //   print(name);
                //   throw('some error');
                // } catch (error) {
                //   print('error ${error.toString()}');
                // }

                // getName().then((value) {
                //   print(value);
                //   print('ahnmde');
                // }).catchError((OnError) {
                //   print(OnError);
                // });

                // insertToDatabase();
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState!.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                    );


                    // insertToDatabase(
                    //   title: titleController.text,
                    //   date: dateController.text,
                    //   time: timeController.text,
                    // ).then((value) {
                    //   getDataFromDatabase(database).then((value) {
                    //     Navigator.pop(context);
                    //
                    //     // setState(() {
                    //     //   isBottomSheetShown = false;
                    //     //
                    //     //   fabIcon = Icons.edit;
                    //     //   tasks = value;
                    //     //   print(tasks);
                    //     //   print(tasks[0]);
                    //     //   print(tasks[0]['title']);
                    //     //   print(tasks[0]['time']);
                    //     // });
                    //   });
                    // });
                  }
                } else {
                  scaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Form(
                            key: formKey,
                            autovalidateMode: autoValidateMode,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultTextFormField(
                                  controller: titleController,
                                  type: TextInputType.text,
                                  validate: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultTextFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value!.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  validate: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'time must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                defaultTextFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2023-10-09'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd().format(value!);
                                      print(dateController.text);
                                    });
                                  },
                                  validate: (value) {
                                    if (value?.isEmpty ?? true) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Date',
                                  prefix: Icons.calendar_month_outlined,
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 15,
                      )
                      .closed
                      .then((value) {
                    // isBottomSheetShown = false;
                    // // setState(() {
                    // //   fabIcon = Icons.edit;
                    // // });
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  // isBottomSheetShown = true;
                  // setState(() {
                  //   fabIcon = Icons.add;
                  // });
                  // setState(() {
                  //   autoValidateMode = AutovalidateMode.always;
                  // });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              // child: isBottomSheetShown ? Icon(Icons.add) : Icon(Icons.edit),
              child: Icon(
                cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                // setState(() {
                //   currentIndex = index;
                //   print(index);
                // });
                cubit.changeIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.check_circle_outline),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.archive_outlined),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> getName() async {
    return 'ALHASSAN MUSLEH';
  }

  // void createDatabase() async {
  //   database = await openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       // ID INTEGER
  //       // title string
  //       // time string
  //       // date string
  //       // status string
  //       print('database created');
  //       database
  //           .execute(
  //         'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT,date TEXT,time TEXT, status TEXT)',
  //       )
  //           .then((value) {
  //         print('table created');
  //       }).catchError((error) {
  //         print('error when table created ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       print('database opened');
  //       getDataFromDatabase(database).then((value) {
  //         // setState(() {
  //         //   tasks = value;
  //         //   print(tasks);
  //         //   print(tasks[0]);
  //         //   print(tasks[0]['title']);
  //         //   print(tasks[0]['time']);
  //         // });
  //       });
  //
  //       //{id: 1, title: first task, date: 02222, time: 891, status: new}
  //     },
  //   );
  // }
  //
  // Future insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  // }) async {
  //   return await database?.transaction((txn) {
  //     return txn
  //         .rawInsert(
  //       'INSERT INTO tasks(title,date,time,status) VALUES ("$title", "$date","$time","new")',
  //     )
  //         .then((value) {
  //       print('$value inserted Successfully');
  //     }).catchError((error) {
  //       print('Error when inserting new record $error');
  //     });
  //   });
  // }
  //
  // Future<List<Map>> getDataFromDatabase(database) async {
  //   return await database.rawQuery('SELECT * FROM tasks');
  // }
}

// class HomeLayout extends StatefulWidget {
//   const HomeLayout({super.key});
//
//   // 1. Create database
//   // 2. create table
//   // 3. open database
//   // 4. insert to database
//   // 5. get from database
//   // 6. update in database
//   // 7. delete from database
//
//   @override
//   State<HomeLayout> createState() => _HomeLayoutState();
// }
//
// class _HomeLayoutState extends State<HomeLayout> {
//   int currentIndex = 0;
//
//   Database? database;
//
//   var scaffoldKey = GlobalKey<ScaffoldState>();
//   var formKey = GlobalKey<FormState>();
//
//   bool isBottomSheetShown = false;
//   IconData fabIcon = Icons.edit;
//   var titleController = TextEditingController();
//   var timeController = TextEditingController();
//   var dateController = TextEditingController();
//   var autoValidateMode = AutovalidateMode.disabled;
//
//   List<Widget> screens = const [
//     NewTasksScreen(),
//     DoneTasksScreen(),
//     ArchivedTasksScreen(),
//   ];
//
//   List<String> screensTitle = const [
//     'New Tasks',
//     'Done Tasks',
//     'Archived Tasks',
//   ];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     createDatabase();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           screensTitle[currentIndex],
//           style: const TextStyle(color: Colors.white),
//         ),
//       ),
//       // body: tasks.length == 0
//       //     ? const Center(
//       //         child: CircularProgressIndicator(),
//       //       )
//       //     : screens[currentIndex],
//       body: ConditionalBuilder(
//         condition: tasks.length > 0,
//         builder: (context) => screens[currentIndex],
//         fallback: (context) => const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // try {
//           //   var name = await getName();
//           //   print(name);
//           //   throw('some error');
//           // } catch (error) {
//           //   print('error ${error.toString()}');
//           // }
//
//           // getName().then((value) {
//           //   print(value);
//           //   print('ahnmde');
//           // }).catchError((OnError) {
//           //   print(OnError);
//           // });
//
//           // insertToDatabase();
//           if (isBottomSheetShown) {
//             if (formKey.currentState!.validate()) {
//               insertToDatabase(
//                 title: titleController.text,
//                 date: dateController.text,
//                 time: timeController.text,
//               ).then((value) {
//                 getDataFromDatabase(database).then((value) {
//                   Navigator.pop(context);
//
//                   setState(() {
//                     isBottomSheetShown = false;
//
//                     fabIcon = Icons.edit;
//                     tasks = value;
//                     print(tasks);
//                     print(tasks[0]);
//                     print(tasks[0]['title']);
//                     print(tasks[0]['time']);
//                   });
//                 });
//               });
//             }
//           } else {
//             scaffoldKey.currentState!
//                 .showBottomSheet(
//                   (context) => Container(
//                     padding: const EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Form(
//                       key: formKey,
//                       autovalidateMode: autoValidateMode,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           defaultTextFormField(
//                             controller: titleController,
//                             type: TextInputType.text,
//                             validate: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'title must not be empty';
//                               }
//                               return null;
//                             },
//                             label: 'Task Title',
//                             prefix: Icons.title,
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           defaultTextFormField(
//                             controller: timeController,
//                             type: TextInputType.datetime,
//                             onTap: () {
//                               showTimePicker(
//                                 context: context,
//                                 initialTime: TimeOfDay.now(),
//                               ).then((value) {
//                                 timeController.text =
//                                     value!.format(context).toString();
//                                 print(value.format(context));
//                               });
//                             },
//                             validate: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'time must not be empty';
//                               }
//                               return null;
//                             },
//                             label: 'Task Time',
//                             prefix: Icons.watch_later_outlined,
//                           ),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           defaultTextFormField(
//                             controller: dateController,
//                             type: TextInputType.datetime,
//                             onTap: () {
//                               showDatePicker(
//                                 context: context,
//                                 initialDate: DateTime.now(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.parse('2023-10-09'),
//                               ).then((value) {
//                                 dateController.text =
//                                     DateFormat.yMMMd().format(value!);
//                                 print(dateController.text);
//                               });
//                             },
//                             validate: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'date must not be empty';
//                               }
//                               return null;
//                             },
//                             label: 'Task Date',
//                             prefix: Icons.calendar_month_outlined,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   elevation: 15,
//                 )
//                 .closed
//                 .then((value) {
//               isBottomSheetShown = false;
//               setState(() {
//                 fabIcon = Icons.edit;
//               });
//             });
//             isBottomSheetShown = true;
//             setState(() {
//               fabIcon = Icons.add;
//             });
//             setState(() {
//               autoValidateMode = AutovalidateMode.always;
//             });
//           }
//         },
//         // child: isBottomSheetShown ? Icon(Icons.add) : Icon(Icons.edit),
//         child: Icon(
//           fabIcon,
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//             print(index);
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.menu),
//             label: 'Tasks',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.check_circle_outline),
//             label: 'Done',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.archive_outlined),
//             label: 'Archived',
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<String> getName() async {
//     return 'ALHASSAN MUSLEH';
//   }
//
//   void createDatabase() async {
//     database = await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: (database, version) {
//         // ID INTEGER
//         // title string
//         // time string
//         // date string
//         // status string
//         print('database created');
//         database
//             .execute(
//           'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT,date TEXT,time TEXT, status TEXT)',
//         )
//             .then((value) {
//           print('table created');
//         }).catchError((error) {
//           print('error when table created ${error.toString()}');
//         });
//       },
//       onOpen: (database) {
//         print('database opened');
//         getDataFromDatabase(database).then((value) {
//           setState(() {
//             tasks = value;
//             print(tasks);
//             print(tasks[0]);
//             print(tasks[0]['title']);
//             print(tasks[0]['time']);
//           });
//         });
//
//         //{id: 1, title: first task, date: 02222, time: 891, status: new}
//       },
//     );
//   }
//
//   Future insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     return await database?.transaction((txn) {
//       return txn
//           .rawInsert(
//         'INSERT INTO tasks(title,date,time,status) VALUES ("$title", "$date","$time","new")',
//       )
//           .then((value) {
//         print('$value inserted Successfully');
//       }).catchError((error) {
//         print('Error when inserting new record $error');
//       });
//     });
//   }
//
//   Future<List<Map>> getDataFromDatabase(database) async {
//     return await database.rawQuery('SELECT * FROM tasks');
//   }
// }
