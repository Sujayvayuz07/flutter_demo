import 'package:flutter_application_1/data/model/repositories/post_repo.dart';
import 'package:flutter_application_1/logic/cubits/post_cubits.dart/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/post_model.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPosts();
  }
  String name = "sujay";

  PostRepository postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<PostModel> post = await postRepository.fetchPost();
      emit(PostLoadedState(post));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
