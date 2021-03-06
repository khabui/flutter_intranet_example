import 'package:flutter/material.dart';

import '../../models/random_user_api.dart';
import '../../models/user_repository.dart';
import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../resources/text_theme.dart';
import '../widgets/user_card.dart';

class ContactsScreen extends StatelessWidget {
  final String title;

  const ContactsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _users = UserRepository().fetchUsers(
      numbers: 20,
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          title,
          style: textTheme(context).heading2.colorWhite,
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              AppIcons.menuIcon,
              color: AppColors.whiteColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: FutureBuilder(
        future: _users,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data.length as int,
              itemBuilder: (BuildContext context, int index) {
                final user = snapshot.data[index];
                return UserCard(
                  user: user is User ? user : null,
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
