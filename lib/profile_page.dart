import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/random_user_api.dart';
import 'resources/colors.dart';
import 'resources/icons.dart';
import 'resources/text_theme.dart';
import 'widgets/info_button.dart';
import 'widgets/vertical_spacing.dart';

class ProfilePage extends StatelessWidget {
  final User user;

  Future<void> _mailTo(String email) async {
    final params = Uri(
      scheme: 'mailto',
      path: email,
    );

    final url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _callTo(String phone) async {
    final url = 'tel:$phone';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  const ProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Profile',
          style: textTheme(context).heading2.colorWhite,
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              height: 128.0,
              width: 128.0,
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: user.getAvatarUrl() ?? "",
                  placeholder: (context, url) => Icon(
                    AppIcons.accountCircleIcon,
                    size: 128.0,
                  ),
                  errorWidget: (context, url, error) => Icon(
                    AppIcons.errorIcon,
                    size: 128.0,
                  ),
                ),
              ),
            ),
            const VerticalSpacing(
              height: 8.0,
            ),
            Text(
              user.getFullName() ?? "",
              style: textTheme(context).heading2.bold.colorWhite,
            ),
            const VerticalSpacing(
              height: 8.0,
            ),
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  border: Border.all(
                    color: AppColors.greyColor300,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8.0)),
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    AppIcons.accountCircleIcon,
                    size: 24.0,
                  ),
                  text: 'Contacts',
                ),
                Tab(
                  icon: Icon(
                    AppIcons.locationIcon,
                    size: 24.0,
                  ),
                  text: 'Location',
                ),
                Tab(
                  icon: Icon(
                    AppIcons.otherInfoIcon,
                    size: 24.0,
                  ),
                  text: 'Other info',
                )
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InfoButton(
                          icon: AppIcons.emailIcon,
                          text: user.email ?? "",
                          onPressed: () => _mailTo(user.email),
                        ),
                        const VerticalSpacing(),
                        InfoButton(
                          icon: AppIcons.mobileIcon,
                          text: user.phone ?? "",
                          onPressed: () => _callTo(user.phone),
                        ),
                        const VerticalSpacing(),
                        InfoButton(
                          icon: AppIcons.phoneIcon,
                          text: user.cell ?? "",
                          onPressed: () => _callTo(user.cell),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InfoButton(
                          icon: AppIcons.locationIcon,
                          text: user.getLocationStreet() ?? "",
                        ),
                        const VerticalSpacing(),
                        InfoButton(
                          icon: AppIcons.cityIcon,
                          text: user.getLocationState() ?? "",
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InfoButton(
                          icon: AppIcons.idIcon,
                          text: 'ID: ${user.id.value}',
                        ),
                        const VerticalSpacing(
                          height: 32.0,
                        ),
                        InfoButton(
                          icon: AppIcons.bookmarkIcon,
                          text:
                              'Registered date: ${DateFormat('yyyy-MM-dd').format(user.registered.date)}',
                        ),
                        const VerticalSpacing(),
                        InfoButton(
                          icon: AppIcons.meetingIcon,
                          text: 'Age joined: ${user.registered.age}',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
