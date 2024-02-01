import 'package:flutter/material.dart';
import 'package:flutter_firebase/real_time_crud.dart';

final TextEditingController nameController = TextEditingController();
final TextEditingController snController = TextEditingController();
final TextEditingController addressController = TextEditingController();

void createAlertDialog(BuildContext context) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Create Content'),
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
            final id = DateTime.now().microsecond.toString();
            databaseReference.child(id).set(
              {
                "name": nameController.text.toString(),
                "sn": snController.text.toString(),
                "address": addressController.text.toString(),
                'id': id,
              },
            );
            nameController.clear();
            snController.clear();
            addressController.clear();

            Navigator.pop(context);
          },
          child: const Text("Add"),
        ),
      ],
    ),
  );
}

// void creatBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//       isScrollControlled: true,
//       context: context,
//       builder: (BuildContext) {
//         return Padding(
//           padding: EdgeInsets.only(
//               top: 20,
//               right: 20,
//               left: 20,
//               bottom: MediaQuery.of(context).viewInsets.bottom + 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Center(
//                 child: Text(
//                   "Create your items",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: "Name",
//                   hintText: "eg.Axel",
//                 ),
//               ),
//               TextField(
//                 controller: snController,
//                 decoration: InputDecoration(
//                   labelText: "S.N",
//                   hintText: "eg.1",
//                 ),
//               ),
//               TextField(
//                 controller: addressController,
//                 decoration: InputDecoration(
//                   labelText: "Address",
//                   hintText: "eg.IND",
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   final id = DateTime.now().microsecond.toString();
//                   databaseReference.child(id).set({
//                     'name': nameController.text.toString(),
//                     'sn': snController.text.toString(),
//                     'address': addressController.text.toString(),
//                     'id': id
//                   });
//                   nameController.clear();
//                   snController.clear();
//                   addressController.clear();
//                   Navigator.pop(context);
//                 },
//                 child: const Text("Add"),
//               )
//             ],
//           ),
//         );
//       });
// }
