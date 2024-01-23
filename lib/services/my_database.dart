import 'package:firebase_database/firebase_database.dart';

class MyDatabase {
  void readData() {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('news');

    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      Map<dynamic, dynamic> values =
          dataSnapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, values) {
        print('title: ${values['title']}');
      });
    });
  }

  void fetchPaginatedData(int pageSize, String lastRecordKey) {
    DatabaseReference databaseReference =
        FirebaseDatabase.instance.ref().child('news');

    Query query = databaseReference.orderByKey().limitToFirst(pageSize);

    query = query.startAt(lastRecordKey);

    query.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;
      Map<dynamic, dynamic> values =
          dataSnapshot.value as Map<dynamic, dynamic>;
      values.forEach((key, values) {
        print('id: $key');
        print('title: ${values['title']}');
        // print('description: ${values['description']}');
        // print('imageUrl: ${values['imageUrl']}');
        // print('createTimeUtc: ${values['createTimeUtc']}');
        // print('source: ${values['source']}');
      });
    });
  }
}
