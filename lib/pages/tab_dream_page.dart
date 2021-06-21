import 'package:lucidy/controllers/data_controller.dart';
import 'package:lucidy/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabDream extends StatefulWidget {
  final String title;
  final String description;
  final bool isEdit;

  const TabDream({
    Key key,
    this.title,
    this.description,
    this.isEdit,
  }) : super(key: key);

  @override
  _TabDreamState createState() => _TabDreamState();
}

class _TabDreamState extends State<TabDream>
    with AutomaticKeepAliveClientMixin<TabDream> {
  //
  //Keeping the sate alive, so forms can be validated on other screens.
  @override
  bool get wantKeepAlive => true;

  TextEditingController titleController;
  TextEditingController descriptionController;

  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    //sets input firlds to their data
    if (widget.isEdit) {
      titleController.text = widget.title;
      descriptionController.text = widget.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                onChanged: (_) {
                  print('onChange Triggered');
                  dataController.setTitle(titleController.text);
                },
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
