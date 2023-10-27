import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_new/core/common/error_text.dart';
import 'package:reddit_new/core/common/loader.dart';
import 'package:reddit_new/core/common/post_card.dart';
import 'package:reddit_new/features/community/controller/community_controller.dart';
import 'package:reddit_new/features/post/controller/post_controller.dart';

import 'package:riverpod/riverpod.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userCommunitiesProvider).when(
          data: (communities) => ref.watch(userPostsProvider(communities)).when(
                data: (data) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      final post = data[index];

                      return PostCart(post: post);
                    },
                  );
                },
                error: ((error, stackTrace) => ErrorText(
                      error: error.toString(),
                    )),
                loading: () => const Loader(),
              ),
          error: ((error, stackTrace) => ErrorText(error: error.toString())),
          loading: () => const Loader(),
        );
  }
}
