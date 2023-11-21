import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/data/model/post_model.dart';
import 'package:flutter_application_1/data/model/repositories/api/api.dart';

class PostRepository {
  PostModel? postModel;
  API api = API();
  Future<List<PostModel>> fetchPost() async {
    try {
      Response res = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = res.data;
      return postMaps.map((e) => PostModel.fromJson(e)).toList();
    } catch (ex) {
      rethrow;
    }
  }
}
