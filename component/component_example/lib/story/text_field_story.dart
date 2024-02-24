import 'package:flutter/material.dart' hide ButtonTheme, AppBar, Image;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final ValueNotifier<bool> _enableClean = ValueNotifier<bool>(false);
final TextEditingController _editC = TextEditingController();
final TextEditingController _passwordC = TextEditingController();
final TextEditingController _dropdownC = TextEditingController();
final TextEditingController _passwordC2 = TextEditingController();

final Story textFieldStory = Story(
  name: 'Widgets/text_field',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: Scaffold(
      backgroundColor: const Color(0xff151E25),
      appBar: const AppBar(
        title: Text('text_field'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
            child: DropdownTextField(
              hintText: 'dropdown textField',
              editingController: _dropdownC,
              prefixIcon: Container(
                constraints: const BoxConstraints(minHeight: 48, maxWidth: 64),
                padding: const EdgeInsets.only(left: 24),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 24,
                    ),
                  ],
                ),
              ),
              prefixIconConstraints:
                  const BoxConstraints(minHeight: 48, minWidth: 64),
              options: List.generate(
                  2,
                  (index) => UIToggleItemUser(
                      id: '$index', username: 'name : $index')),
              horizontalMargin: 30,
              height: 48,
              onUserChoose: (p0) {
                _dropdownC.text = 'name : $p0';
              },
              onUserRemove: (p0) {
                print('remove $p0');
              },
            ),
          ),
          OvalTextField(
            editingController: _editC,
            errorText: 'OvalTextField error text',
            autofocus: false,
            onChanged: (string) {
              _enableClean.value = string.isNotEmpty;
            },
            hintText: 'hintText',
            contentPadding: const EdgeInsets.only(left: 0, top: 12, bottom: 12),
            prefixIcon: const Icon(
              Icons.people,
              color: Colors.white,
            ),
            // obscureText: true,

            // maxLines: 2,
            // height: 200,
            prefixIconConstraints:
                const BoxConstraints(minHeight: 48, minWidth: 48),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 48, minWidth: 48),
            suffixIcon: Container(
              constraints: const BoxConstraints(minWidth: 40, maxWidth: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ValueListenableBuilder<bool>(
                    builder: (context, value, child) {
                      return Visibility(
                        visible: _enableClean.value,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            _editC.clear();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Image.asset(
                              'assets/images/com_delete2.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ),
                      );
                    },
                    valueListenable: _enableClean,
                  ),
                ],
              ),
            ),
          ),
          const UnderlineTextField(
            title: '上标题',
            titleStyle: TextStyle(color: Colors.white, fontSize: 16),
            hintText: 'hint string',
            contentPadding: EdgeInsets.symmetric(vertical: 25),
          ),
          UnderlineTextField(
            hintText: 'hint string',
            prefixIcon: Container(
              width: 50,
              alignment: Alignment.center,
              child: const Text(
                '左标题',
                style: TextStyle(
                  height: 1.2,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 25),
          ),
          PasswordTextField(
            hintText: 'password',
            editingController: _passwordC,
            title: 'title',
            textFieldBorderStyle: TextFieldBorderStyle.custom,
          ),
          PasswordTextField(
            hintText: 'password',
            editingController: _passwordC2,
            isShowClean: true,
            title: 'title',
            textFieldBorderStyle: TextFieldBorderStyle.oval,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
        ],
      ),
    ),
  ),
);
