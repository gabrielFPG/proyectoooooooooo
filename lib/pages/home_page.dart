import 'package:flutter/material.dart';
import 'package:wikifood/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  // Controlador para el campo de texto
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    // Liberar el controlador cuando el widget se elimine
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nombre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            // Campo de texto para el nombre del plato
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Escribir el nombre del plato',
              ),
            ),
            const SizedBox(height: 20), // Espacio entre los widgets
            // Botón para guardar el nombre
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.trim().isEmpty) {
                  // Mostrar un mensaje de error si el campo está vacío
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('El nombre no puede estar vacío'),
                    ),
                  );
                  return;
                }

                // Guardar el nombre en Firestore y regresar a la página anterior
                await addComida(nameController.text).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WIKIFOOD'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: getComida(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]['nombre'] ?? 'Nombre no disponible'),
                    onTap: () {
                      Navigator.pushNamed(context, "/edit", arguments: {
                        "nombre": snapshot.data?[index]['nombre'],
                      });
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No hay datos disponibles'),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
