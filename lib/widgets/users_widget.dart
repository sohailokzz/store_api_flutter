import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_app/constants/global_colors.dart';
import 'package:store_api_app/models/users_model.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsersModel>(context);
    Size size = MediaQuery.of(context).size;
    return ListTile(
      leading: Image.network(
        userProvider.avatar.toString(),
        width: size.width * 0.15,
        height: size.height * 0.15,
        fit: BoxFit.fill,
        errorBuilder: (
          BuildContext context,
          Object exception,
          StackTrace? stackTrace,
        ) {
          return const Text('😢');
        },
      ),
      title: Text(
        userProvider.name.toString(),
      ),
      subtitle: Text(
        userProvider.email.toString(),
      ),
      trailing: Text(
        userProvider.role.toString(),
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
