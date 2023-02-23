import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_app/models/users_model.dart';
import 'package:store_api_app/services/api_handler.dart';
import 'package:store_api_app/widgets/users_widget.dart';

import '../constants/global_colors.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
      ),
      body: FutureBuilder<List<UsersModel>>(
        future: ApiHandlers.getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: lightIconsColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("An Error accured ${snapshot.error}"),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("No data added yet"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const UserWidget(),
              );
            },
          );
        },
      ),
    );
  }
}
