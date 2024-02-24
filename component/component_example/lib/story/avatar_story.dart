import 'package:flutter/material.dart' hide ButtonTheme, Badge;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story avatarStory = Story(
  name: 'Widgets/avatar',
  builder: (context) => MaterialApp(
    title: 'Storybook Flutter',
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: Scaffold(
      body: Center(
        child: Row(
          children: [
            Avatar.circle(
              backgroundImage: const AssetImage('assets/images/avatar.jpeg'),
              backgroundColor: Colors.transparent,
              backgroundImageColorFilter:
                  const Color(0xff000000).withOpacity(0.6),
              radius: 34,
              child: const Text(
                'U',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ),
            const Badge(
              count: 4,
              child: Avatar.rectangle(
                rectangleRadius: 34,
                backgroundColor: Color(0xffcccccc),
                child: Text(
                  'User',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Avatar.circle(
              radius: 34,
              backgroundColor: Color(0xfffde3cf),
              child: Text(
                'U',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xfff56a00),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  ),
);
