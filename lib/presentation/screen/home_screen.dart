import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/data/model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/repositories/post_repo.dart';
import '../../logic/cubits/post_cubits.dart/post_cubit.dart';
import '../../logic/cubits/post_cubits.dart/post_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostRepository post = PostRepository();
  PostCubit? postCubit;
  @override
  void initState() {
    // TODO: implement initState

    fetchPost();

    super.initState();
  }

  fetchPost() async {
    List<PostModel> list = await post.fetchPost();
    log(list.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("HomeScreen")),
        body: SafeArea(
            child:
                BlocConsumer<PostCubit, PostState>(listener: (context, state) {
          if (state is PostErrorState) {
            SnackBar snackBar = SnackBar(content: Text(state.error));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }, builder: (context, state) {
          if (state is PostLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          //checktrigger is working
          if (state is PostLoadedState) {
            return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  PostModel post = state.posts[index];
                  return Text(post.body.toString());
                });
          }
          return const Center(child: Text("An error Occurs"));
        })));
  }
}
