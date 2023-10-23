import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_new/core/providers/storage_repository_provider.dart';
import 'package:reddit_new/core/utils.dart';
import 'package:reddit_new/features/auth/controller/auth_controller.dart';
import 'package:reddit_new/features/post/repository/post_repository.dart';
import 'package:reddit_new/models/community_model.dart';
import 'package:reddit_new/models/post_model.dart';
import 'package:routemaster/routemaster.dart';
import 'package:uuid/uuid.dart';

final postControllerProvider =
    StateNotifierProvider<PostController, bool>((ref) {
  final postRepository = ref.watch(postRepositoryProvider);
  final storageRepository = ref.watch(storageRepositoryProvider);
  return PostController(
      postRepository: postRepository,
      storageRepository: storageRepository,
      ref: ref);
});

class PostController extends StateNotifier<bool> {
  final PostRepository _postRepository;
  final Ref _ref;
  final StorageRepository _storageRepository;
  PostController({
    required PostRepository postRepository,
    required Ref ref,
    required StorageRepository storageRepository,
  })  : _postRepository = postRepository,
        _ref = ref,
        _storageRepository = storageRepository,
        super(false);
  // Text
  void shareTextPost({
    required BuildContext context,
    required String title,
    required Community selectedCommunity,
    required String description,
  }) async {
    // the loading is starting now
    // why user!.name ??? video doesn't has
    state = true;
    String postId = const Uuid().v1();
    final user = _ref.read(userProvider);
    final Post post = Post(
      id: postId,
      title: title,
      communityName: selectedCommunity.name,
      communityProfilePic: selectedCommunity.avatar,
      upvotes: [],
      downvotes: [],
      commentCount: 0,
      username: user!.name,
      uid: user.uid,
      type: 'text',
      createAt: DateTime.now(),
      awards: [],
      description: description,
    );

    final res = await _postRepository.addPost(post);
    // loading stop
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Post successfully!');
      Routemaster.of(context).pop();
    });
  }

  // Link
  void shareLinkPost({
    required BuildContext context,
    required String title,
    required Community selectedCommunity,
    required String link,
  }) async {
    // the loading is starting now
    // why user!.name ??? video doesn't has
    state = true;
    String postId = const Uuid().v1();
    final user = _ref.read(userProvider);
    final Post post = Post(
      id: postId,
      title: title,
      communityName: selectedCommunity.name,
      communityProfilePic: selectedCommunity.avatar,
      upvotes: [],
      downvotes: [],
      commentCount: 0,
      username: user!.name,
      uid: user.uid,
      type: 'link',
      createAt: DateTime.now(),
      awards: [],
      link: link,
    );

    final res = await _postRepository.addPost(post);
    // loading stop
    state = false;

    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Post successfully!');
      Routemaster.of(context).pop();
    });
  }

  // Image
  void shareImagePost({
    required BuildContext context,
    required String title,
    required Community selectedCommunity,
    required File? file,
  }) async {
    // the loading is starting now
    // why user!.name ??? video doesn't has
    state = true;
    String postId = const Uuid().v1();
    final user = _ref.read(userProvider);
    final imageRes = await _storageRepository.storeFile(
      path: 'post/${selectedCommunity.name}',
      id: postId,
      file: file,
    );
    imageRes.fold((l) => showSnackBar(context, l.message), (r) async {
      final Post post = Post(
        id: postId,
        title: title,
        communityName: selectedCommunity.name,
        communityProfilePic: selectedCommunity.avatar,
        upvotes: [],
        downvotes: [],
        commentCount: 0,
        username: user!.name,
        uid: user.uid,
        type: 'image',
        createAt: DateTime.now(),
        awards: [],
        link:
            r, // r cause if success , it will give URL of the Image uploaded in Firebase storage
      );

      final res = await _postRepository.addPost(post);
      // loading stop
      state = false;

      res.fold((l) => showSnackBar(context, l.message), (r) {
        showSnackBar(context, 'Post successfully!');
        Routemaster.of(context).pop();
      });
    });
  }
}
