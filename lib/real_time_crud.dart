import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/create_bottom_sheet.dart';
import 'package:flutter_firebase/update_modal_sheet.dart';

class RealTimeCrud extends StatefulWidget {
  const RealTimeCrud({super.key});

  @override
  State<RealTimeCrud> createState() => _RealTimeCrudState();
}

final databaseReference = FirebaseDatabase.instance.ref();

class _RealTimeCrudState extends State<RealTimeCrud> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Realtime Database"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: databaseReference,
              itemBuilder: (context, snapshot, animation, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      snapshot.child('name').value.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.child('address').value.toString(),
                    ),
                    leading: CircleAvatar(
                      child: Text(
                        snapshot.child('sn').value.toString(),
                      ),
                    ),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              updateAlertDialog(
                                context,
                                snapshot.child('name').value.toString(),
                                snapshot.child('sn').value.toString(),
                                snapshot.child('address').value.toString(),
                                snapshot.child('id').value.toString(),
                              );
                            },
                            leading: const Icon(Icons.edit),
                            title: const Text('Edit'),
                          ),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: ListTile(
                            onTap: () {
                              Navigator.pop(context);
                              databaseReference
                                  .child(snapshot.child('id').value.toString())
                                  .remove();
                            },
                            leading: const Icon(Icons.delete),
                            title: const Text('Delete'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createAlertDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
