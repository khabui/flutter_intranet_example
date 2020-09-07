import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../models/random_user_api.dart';
import '../../resources/colors.dart';
import '../../resources/icons.dart';
import '../../resources/text_theme.dart';
import '../../resources/values.dart';
import '../screens/profile_screen.dart';
import 'horizontal_spacing.dart';

class UserListTile extends StatelessWidget {
  final User user;

  const UserListTile({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 10.0,
      ),
      leading: Container(
        width: 56.0,
        height: 56.0,
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: user.getAvatarUrl() ?? "",
            placeholder: (context, url) => const Icon(
              AppIcons.accountCircleIcon,
              size: 56.0,
            ),
            errorWidget: (context, url, error) => const Icon(
              AppIcons.errorIcon,
              size: 56.0,
            ),
          ),
        ),
      ),
      title: Text(
        user.getFullName(),
        style: textTheme(context).bodyLarge.colorWhite,
      ),
      subtitle: Row(
        children: <Widget>[
          const Icon(
            AppIcons.emailIcon,
            color: AppColors.whiteColor30,
          ),
          const HorizontalSpacing(
            width: 8.0,
          ),
          Expanded(
            child: Text(
              user.email ?? "",
              maxLines: 2,
              style: textTheme(context).bodyMedium.colorWhite,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            Routes.profile,
            arguments: ProfileScreenArguments(user: user),
          );
        },
        icon: const Icon(
          AppIcons.rightArrowIcon,
          color: AppColors.whiteColor,
          size: 28.0,
        ),
      ),
    );
  }
}
