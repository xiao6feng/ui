import 'package:component_example/story/button_story.dart';
import 'package:component_example/story/image_story.dart';
import 'package:component_example/story/table_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import 'story/app_bar_story.dart';
import 'story/app_search_bar_story.dart';
import 'story/avatar_story.dart';
import 'story/badget_story.dart';
import 'story/calling_code_story.dart';
import 'story/dialog_story.dart';
import 'story/dropdown_button_story.dart';
import 'story/form_text_field_story.dart';
import 'story/gesture_password_story.dart';
import 'story/intro_view_story.dart';
import 'story/list_tile_story.dart';
import 'story/photo_view_story.dart';
import 'story/picker_story.dart';
import 'story/popup_menu_button_story.dart';
import 'story/radio_story.dart';
import 'story/search_tag_story.dart';
import 'story/switch_story.dart';
import 'story/tab_story.dart';
import 'story/toast_story.dart';
import 'story/text_field_story.dart';
import 'story/uploader_story.dart';

void main() {
  runApp(const StoryBoard());
}

///
class StoryBoard extends StatelessWidget {
  const StoryBoard({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext ctx, Widget? widget) {
        return Storybook(
          initialStory: 'Widgets/calling code',
          stories: [
            tableStory,
            buttonStory,
            dialogStory,
            avatarStory,
            badgeStory,
            radioStory,
            switchStory,
            tabStory,
            uploaderStory,
            photoViewStory,
            textFieldStory,
            appBarStory,
            imageStory,
            appSearchBarStory,
            popupMenuButtonStory,
            dropdownButtonStory,
            searchTagStory,
            introViewStory,
            listTileStory,
            pickerStory,
            formTextFieldStory,
            callCodeStory,
            gesturePasswordStory,
            toastStory,
          ],
        );
      },
    );
  }
}
