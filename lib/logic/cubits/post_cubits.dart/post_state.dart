import 'package:flutter_application_1/data/model/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

//this state for loading and api when loading
class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
