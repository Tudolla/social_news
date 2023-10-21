// log out
// log in

import 'package:flutter/material.dart';
import 'package:reddit_new/features/auth/screens/login_screen.dart';
import 'package:reddit_new/features/community/screens/add_mods_screen.dart';
import 'package:reddit_new/features/community/screens/community_screen.dart';
import 'package:reddit_new/features/community/screens/create_community_screen.dart';
import 'package:reddit_new/features/community/screens/edit_community_screen.dart';
import 'package:reddit_new/features/community/screens/mod_tools_screen.dart';
import 'package:reddit_new/features/home/screens/home_screen.dart';
import 'package:reddit_new/features/post/screens/add_post_screen.dart';
import 'package:reddit_new/features/post/screens/add_post_type_screen.dart';
import 'package:reddit_new/features/user_profile/screens/edit_profile_screen.dart';
import 'package:reddit_new/features/user_profile/screens/user_profile_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: LoginScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/create-community': (_) =>
      const MaterialPage(child: CreateCommunityScreen()),
  // dynamic router , cause there are many COMMUNITY with diff name
  // : truoc name rat quan trong , no hieu rang - do la paramter
  '/r/:name': (route) => MaterialPage(
        child: CommunityScreen(
          name: route.pathParameters['name']!,
        ),
      ),
  '/mod-tools/:name': (routeData) => MaterialPage(
        child: ModToolsScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/edit-community/:name': (routeData) => MaterialPage(
        child: EditCommunityScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/add-mods/:name': (routeData) => MaterialPage(
        child: AddModsScreen(
          name: routeData.pathParameters['name']!,
        ),
      ),
  '/u/:uid': (routeData) => MaterialPage(
        child: UserProfileScreen(
          uid: routeData.pathParameters['uid']!,
        ),
      ),
  '/edit-profile/:uid': (routeData) => MaterialPage(
        child: EditProfileScreen(
          uid: routeData.pathParameters['uid']!,
        ),
      ),
  '/add-post/:type': (routeData) => MaterialPage(
        child: AddPostTypeScreen(
          type: routeData.pathParameters['type']!,
        ),
      ),
});
