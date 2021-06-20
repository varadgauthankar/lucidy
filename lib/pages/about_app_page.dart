import 'package:dream_journal/utils/helpers.dart';
import 'package:dream_journal/utils/text_style.dart';
import 'package:dream_journal/widgets/tile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
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
                  'App Name',
                  style: TileTitle.light,
                ),
                Text('version: 1.0.1', style: TileSubtitle.light),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(EvaIcons.starOutline),
                    ),
                    IconButton(
                      onPressed: () {},
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
                  'Varad Gauthankar',
                  style: TileTitle.light,
                ),
                Text('Developer', style: TileSubtitle.light),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(EvaIcons.githubOutline),
                    ),
                    IconButton(
                      onPressed: () {},
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
