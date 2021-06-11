import 'package:dream_journal/controllers/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLabelDialog extends StatefulWidget {
  const AddLabelDialog({Key key}) : super(key: key);

  @override
  _AddLabelDialogState createState() => _AddLabelDialogState();
}

class _AddLabelDialogState extends State<AddLabelDialog> {
  TextEditingController labelController;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    labelController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    labelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Label'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: key,
            child: TextFormField(
              maxLines: null,
              controller: labelController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Label Title",
              ),
              validator: (val) {
                if (val.isEmpty)
                  return 'Enter label title';
                else
                  return null;
              },
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
            child: Text('CANCEL'), onPressed: () => Navigator.pop(context)),
        TextButton(
            child: Text('ADD'),
            onPressed: () {
              if (key.currentState.validate()) {
                Provider.of<DataController>(context, listen: false)
                    .addLabel(labelController.text);
                Navigator.pop(context);
              }
            }),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
