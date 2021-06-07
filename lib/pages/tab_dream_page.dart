import 'package:dream_journal/utils/helpers.dart';
import 'package:flutter/material.dart';

class TabDream extends StatefulWidget {
  const TabDream({Key key}) : super(key: key);

  @override
  _TabDreamState createState() => _TabDreamState();
}

class _TabDreamState extends State<TabDream> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(12.0),
      children: [
        Column(
          children: [
            TextFormField(
              controller: titleController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Title",
                hintText: "Title",
              ),
              validator: (value) {
                if (value.isEmpty)
                  return 'Please enter the title';
                else
                  return null;
              },
            ),
            spacer(height: 12.0),
            TextFormField(
              maxLines: null,
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Description",
                hintText: "My Dream...",
              ),
              validator: (value) {
                if (value.isEmpty)
                  return 'Please enter the description name';
                else
                  return null;
              },
            ),
          ],
        ),
      ],
    );
  }
}
