import 'package:flutter/material.dart';
import 'package:wikifood/services/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  // Controlador para el campo de texto
  TextEditingController nameController = TextEditingController(text: "");

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