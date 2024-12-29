import 'package:flutter/material.dart';
import 'package:todo_app_v2/models/user_model.dart';

class UserComponent extends StatelessWidget {
  final UserModel user;
  const UserComponent({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              const SizedBox(
                width: 60.0,
                height: 60.0,
              ),
              Positioned(
                  bottom: 5,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    height: 60.0,
                    // child: Image.network('https://cdn.pixabay.com/photo/2023/12/14/20/24/christmas-balls-8449615_640.jpg'),
                    child: Image.network('${user.avatar}'),
                  ),
                ),
              Positioned(
                bottom: 15,
                left: 80,
                width: 180.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${user.firstName}'),
                    Text(
                      '${user.lastName}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black45,
                          overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
