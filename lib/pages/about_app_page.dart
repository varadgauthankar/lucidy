import 'package:lucidy/constants/app_constants.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:lucidy/utils/text_style.dart';
import 'package:lucidy/widgets/tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
          style: AppBarTitleStyle.lightDark,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(4.0),
        children: [
          Tile(
            child: Column(
              children: [
                FlutterLogo(
                  size: 55,
                ),
                spacer(height: 6.0),
                Text(
                  kAppName,
                  style:
                      isThemeDark(context) ? TileTitle.dark : TileTitle.light,
                ),
                Text(
                  'version: 1.0.0',
                  style: isThemeDark(context)
                      ? TileSubtitle.dark
                      : TileSubtitle.light,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => launch(kAppPlayStoreLink),
                      icon: Icon(EvaIcons.starOutline),
                    ),
                    IconButton(
                      onPressed: () => launch(kAppPlayStoreLink),
                      icon: Icon(EvaIcons.shoppingBagOutline),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(EvaIcons.shareOutline),
                    )
                  ],
                )
              ],
            ),
          ),
          Tile(
            child: Column(
              children: [
                FlutterLogo(
                  size: 55,
                ),
                spacer(height: 6.0),
                Text(
                  kDeveloperName,
                  style:
                      isThemeDark(context) ? TileTitle.dark : TileTitle.light,
                ),
                Text('Developer',
                    style: isThemeDark(context)
                        ? TileSubtitle.dark
                        : TileSubtitle.light),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () => launch(kGitHubUrl),
                      icon: Icon(EvaIcons.githubOutline),
                    ),
                    IconButton(
                      onPressed: () => launch(kTwitterUrl),
                      icon: Icon(EvaIcons.twitterOutline),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
