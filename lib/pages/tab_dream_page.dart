import 'package:dream_journal/controllers/data_controller.dart';
import 'package:dream_journal/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabDream extends StatefulWidget {
  final String title;
  final String description;
  final bool isEdit;

  const TabDream({Key key, this.title, this.description, this.isEdit})
      : super(key: key);

  @override
  _TabDreamState createState() => _TabDreamState();
}

class _TabDreamState extends State<TabDream> {
  TextEditingController titleController;
  TextEditingController descriptionController;

  // sets input to the value of the dream
  setData() {
    titleController.text = widget.title;
    descriptionController.text = widget.description;
  }

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();

    if (widget.isEdit) setData();

    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataController dataController =
        Provider.of<DataController>(context, listen: false);
    return ListView(
      padding: EdgeInsets.all(12.0),
      children: [
        Form(
          key: dataController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Title",
                  hintText: "Title",
                ),
                onChanged: (_) => dataController.setTitle(titleController.text),
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
                onChanged: (_) =>
                    dataController.setDescription(descriptionController.text),
                validator: (value) {
                  if (value.isEmpty)
                    return 'Please enter the description name';
                  else
                    return null;
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
