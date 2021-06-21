import 'package:lucidy/controllers/hive_controller.dart';
import 'package:flutter/material.dart';

class ConfirmDelete extends StatelessWidget {
  final int dreamKey;

  const ConfirmDelete({Key key, this.dreamKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DreamController dreamController = DreamController();

    return AlertDialog(
      title: Text('Delete dream?'),
      content: Text('Are you sure to delete? This cannot be un done.'),
      actions: [
        TextButton(
            child: Text('CANCEL'), onPressed: () => Navigator.pop(context)),
        TextButton(
            child: Text('DELETE'),
            onPressed: () {
              dreamController.deleteDream(dreamKey);
              Navigator.pop(context);
            }),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
