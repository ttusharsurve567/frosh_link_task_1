import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:frosh_link_task_1/screens/modal_bottom_sheet_screen.dart'
    show FilterType;
import 'package:http/http.dart' as http;

class Model with ChangeNotifier {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Model(
      {@required this.albumId,
      @required this.id,
      @required this.title,
      @required this.url,
      @required this.thumbnailUrl});
}

class Models with ChangeNotifier {
  List<Model> _models = [];

  List<Model> get models {
    return [..._models];
  }

  void filter(FilterType filtertype) {
    if (filtertype == FilterType.Ascending) {
      _models.sort((a, b) => a.id.compareTo(b.id));
    } else if (filtertype == FilterType.Descending) {
      _models.sort((b, a) => a.id.compareTo(b.id));
    } else if (filtertype == FilterType.AlbumWiseAscending) {
      _models.sort((a, b) => a.albumId.compareTo(b.albumId));
    } else if (filtertype == FilterType.AlbumWiseDescending) {
      _models.sort((b, a) => a.albumId.compareTo(b.albumId));
    }
    notifyListeners();
  }

  Future<void> fetchModels() async {
    const url = 'https://jsonplaceholder.typicode.com/photos';
    try {
      final response = await http.get(Uri.parse(url));
      // print(json.decode(response.body));
      final extractedData = json.decode(response.body) as List<dynamic>;
      final List<Model> loadedModels = [];
      extractedData.forEach((element) {
        loadedModels.add(Model(
            albumId: element['albumId'],
            id: element['id'],
            thumbnailUrl: element['thumbnailUrl'],
            title: element['title'],
            url: element['url']));
      });
      _models = loadedModels;

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Model findById(int id) {
    return _models.firstWhere((m) => m.id == id);
  }
}
