import 'package:flutter/material.dart';
import 'package:flutter_firebase/real_time_crud.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController snController = TextEditingController();
final TextEditingController addressController = TextEditingController();

void updateAlertDialog(BuildContext context, name, sn, address, id) {
  nameController.text = name;
  snController.text = sn;
  addressController.text = address;
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Update Content'),
      actions: <Widget>[
        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "Name",
            hintText: "Axel",
          ),
        ),
        TextField(
          keyboardType: TextInputType.number,
          controller: snController,
          decoration: const InputDecoration(
            labelText: "S.N",
            hintText: "1",
          ),
        ),
        TextField(
          controller: addressController,
          decoration: const InputDecoration(
            labelText: "Address",
            hintText: "IND",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            databaseReference.child(id).update(
              {
                "name": nameController.text.toString(),
                "sn": snController.text.toString(),
                "address": addressController.text.toString(),
              },
            );

            Navigator.pop(context);
          },
          child: const Text("Update"),
        )
      ],
    ),
  );
}
