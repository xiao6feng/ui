import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story formTextFieldStory = Story(
  name: 'Widgets/form_text_field',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: const Scaffold(
      backgroundColor: Color(0xff151E25),
      appBar: AppBar(
        title: Text('form_text_field'),
      ),
      body: Form(
        child: Column(
          children: [
            UnderlineFormTextField(
              hintText: 'hint string',
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              errorText: 'UnderlineFormTextField error text',
            ),
            InputFormTextField(
              hintText: 'hint string',
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
            ),
          ],
        ),
      ),
    ),
  ),
);
