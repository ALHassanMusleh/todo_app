import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/shared/cubit/cubit.dart';

Widget defaultButton({
  double width = double.infinity,
  Color backGround = Colors.blue,
  required String text,
  required void Function() onPressed,
  bool isUpper = true,
  double radius = 0,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: backGround,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
      child: MaterialButton(
        height: 50,
        onPressed: onPressed,
        // onPressed: () {
        //   // print(emailController.text);
        //   // print(passwordController.text);
        //
        // },
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    );

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmitted,
  void Function(String)? onChanged,
  required String? Function(String?) validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool obscureText = false,
  void Function()? onPressedIconSuffix,
  Function()? onTap,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      validator: validate,
      obscureText: obscureText,
      keyboardType: type,
      onTap: onTap,
      enabled: isClickable,
      decoration: InputDecoration(
        hintText: label,
        labelText: label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: onPressedIconSuffix,
              )
            : null,
      ),
    );

Widget buildTaskItem(Map task, context) => Dismissible(
      key: Key(task['id'].toString()),
      onDismissed: (DismissDirection) {
        AppCubit.get(context).deleteData(id: task['id']);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              child: Text(
                '${task['time']}',
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${task['title']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${task['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            IconButton(
              color: Colors.green,
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'done',
                  id: task['id'],
                );
              },
              icon: Icon(
                Icons.check_box,
              ),
            ),
            IconButton(
              color: Colors.black45,
              onPressed: () {
                AppCubit.get(context).updateData(
                  status: 'archived',
                  id: task['id'],
                );
              },
              icon: Icon(
                Icons.archive,
              ),
            ),
          ],
        ),
      ),
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>ConditionalBuilder(
  condition: tasks.length > 0,
  builder: (context)=>     ListView.separated(
    itemBuilder: (context, index) => buildTaskItem(
        tasks[index],context
    ),
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    ),
    itemCount: tasks.length,
  ),
  fallback: (context) => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100,color: Colors.grey,),
        Text(
          'No Tasks yet,please Add some Tasks',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  ),
);