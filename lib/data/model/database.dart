import 'package:hive_flutter/hive_flutter.dart';

// ! Not in use
class MovieDataBase {
  List bookmarkList = [];
  final _myBox = Hive.box('movieBox');

  // Upload Database
  void uploadData() {
    _myBox.put("BOOKMARKLIST", bookmarkList);
  }

  // Load data
  void loadData() {
    _myBox.get("BOOKMARKLIST");
  }

  // Initialize the data
  void initializeData() {
    bookmarkList = [
      ["", false]
    ];
  }
}
