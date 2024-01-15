import 'package:firebase_database/firebase_database.dart';


class FirebaseRealtimeDatabase {
  Future<void> storeValue (String reference,String tag,String value)async{
    DatabaseReference db = FirebaseDatabase.instance.ref(reference);
    await db.child(tag).set(value);

  }

  Future<String?> getValue(String reference, String tag) async {
    DatabaseReference db = FirebaseDatabase.instance.ref(reference);
    DataSnapshot snapshot = await db.child(tag).get();

    if (snapshot.value != null) {
      // Veri bulunduğunda değeri döndür
      return snapshot.value.toString();
    } else {
      // Veri bulunamadığında null döndür
      return null;
    }
  }

  

  

  
}