import 'package:crud/services/firebase_service.dart';
import 'package:flutter/material.dart';

class PersonList extends StatefulWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    await deletePeople(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "¿Está seguro de eliminar a ${snapshot.data?[index]['name']}?",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, false);
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, true);
                              },
                              child: const Text("Sí, estoy seguro"),
                            ),
                          ],
                        );
                      },
                    );

                    return result;
                  },
                  background: Container(
                    color: Colors.red.shade300,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,
                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    tileColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Text(
                      snapshot.data?[index]['name'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () async {
                      await Navigator.pushNamed(
                        context,
                        '/edit',
                        arguments: {
                          'name': snapshot.data?[index]['name'],
                          'uid': snapshot.data?[index]['uid'],
                        },
                      );
                      setState(() {});
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        backgroundColor: Colors.deepPurpleAccent,
        child: const Icon(Icons.add),
      ),
    );
  }
}
