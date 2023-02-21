import 'package:flutter/material.dart';
import 'package:store_api_app/constants/global_colors.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: Image.network(
        width: size.width * 0.15,
        height: size.height * 0.15,
        "https://placeimg.com/640/480/any",
        fit: BoxFit.fill,
      ),
      title: const Text('User Name'),
      subtitle: const Text('User@gmail.com'),
      trailing: Text(
        'User Role',
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
