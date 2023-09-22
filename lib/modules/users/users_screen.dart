import 'package:flutter/material.dart';
import 'package:todo_app/models/user/user_model.dart';


class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<UserModel> userList = [
      UserModel(id: 1, name: 'hassan', phone: '+05999999999'),
      UserModel(id: 2, name: 'ahmmed', phone: '+05999999999'),
      UserModel(id: 3, name: 'mohammde', phone: '+05999999999'),
      UserModel(id: 4, name: 'abdallah', phone: '+05999999999'),
      UserModel(id: 5, name: 'ali', phone: '+05999999999'),
      UserModel(id: 6, name: 'hassan', phone: '+05999999999'),
      UserModel(id: 1, name: 'hassan', phone: '+05999999999'),
      UserModel(id: 2, name: 'ahmmed', phone: '+05999999999'),
      UserModel(id: 3, name: 'mohammde', phone: '+05999999999'),
      UserModel(id: 4, name: 'abdallah', phone: '+05999999999'),
      UserModel(id: 5, name: 'ali', phone: '+05999999999'),
      UserModel(id: 6, name: 'hassan', phone: '+05999999999'),
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(userList[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          ),
        ),
        itemCount: userList.length,
      ),
    );
  }
// 1. build item (resusable item)
// 2. build list
// 3. build item to list

  Widget buildUserItem(UserModel user) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              child: Text(
                user.id.toString(),
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  user.phone.toString(),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
