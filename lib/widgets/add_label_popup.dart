import 'package:lucidy/controllers/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddLabelDialog extends StatefulWidget {
  final bool isFromSettings;
  const AddLabelDialog({Key key, this.isFromSettings = false})
      : super(key: key);

  @override
  _AddLabelDialogState createState() => _AddLabelDialogState();
}

class _AddLabelDialogState extends State<AddLabelDialog> {
  TextEditingController labelController;

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
    DataController dataController =
        Provider.of<DataController>(context, listen: false);
    return AlertDialog(
      title: Text('Add Label'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: dataController.formKey2,
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
              if (dataController.validateForm(key: 'label')) {
                dataController.addLabel(labelController.text);
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
