import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db =FirebaseFirestore.instance;

Future<List>getComida() async {
  List comida = [];
  QuerySnapshot querySnapshot = await db.collection('comida').get();
  for (var doc in querySnapshot.docs) {
    comida.add(doc.data());
  };
  return comida;
}


//guardar en bd
Future<void> addComida(String nombre) async {
  await db.collection('comida').add({"nombre":nombre});
}