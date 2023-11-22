import 'package:flutter_application_1/data/model/post_model.dart';

abstract class PostState {}

class PostLoadingState extends PostState {}

//this state for loading and api when hitting
class PostLoadedState extends PostState {
  final List<PostModel> posts;
  PostLoadedState(this.posts);
}

//this state is for error state
class PostErrorState extends PostState {
  final String error;
  PostErrorState(this.error);
}
