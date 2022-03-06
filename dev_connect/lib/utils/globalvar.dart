import 'dart:core';

import 'package:dev_connect/screens/add_post_screen.dart';
import 'package:dev_connect/screens/feeds_screen.dart';
import 'package:dev_connect/screens/profile_screen.dart';
import 'package:dev_connect/screens/search_screen.dart';
import 'package:filter_list/filter_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dev_connect/screens/add_post_screen.dart';
import 'package:flutter_tagging/flutter_tagging.dart';

const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const feedScreen(),
  const SearchScreen(),
  const addPostScreen(),
  ProfileScreen(
    uid: (FirebaseAuth.instance.currentUser!.uid),
  ),
];

class Requirement extends Taggable {
  final String name;

  Requirement({required this.name});

  @override
  List<Object> get props => [name];

  /// Converts the class to json string.
  String toJson() => '''  {
    "name": $name,\n
    
  }''';
}

/*List<Requirement> getRequirements = [
  Requirement(tags: "AI-ML",),
  Requirement(tags: "Project ",),
  Requirement(tags: "App Dev ", ),
  Requirement(tags: "Question ", ),
  Requirement(tags: "Backend ", ),
  Requirement(tags: "UI/UX ", ),
  Requirement(tags: "Help ", ),
  Requirement(tags: "Frontend  ", ),
  Requirement(tags: "Design ", ),
  Requirement(tags: "Web Dev  ", ),
  Requirement(tags: "Hackathon", ),
  Requirement(tags: "Pair Programming ", ),
];*/

class RequirementService {
  /// Mocks fetching language from network API with delay of 500ms.
  static Future<List<Requirement>> getRequirements(String query) async {
    await Future.delayed(Duration(milliseconds: 500), null);
    return <Requirement>[
      Requirement(
        name: 'AI-ML',
      ),
      Requirement(
        name: 'PROJECT',
      ),
      Requirement(
        name: 'APP DEV',
      ),
      Requirement(
        name: 'QUESTION',
      ),
      Requirement(
        name: 'BACKEND',
      ),
      Requirement(
        name: 'UI/UX',
      ),
      Requirement(
        name: 'HELP',
      ),
      Requirement(
        name: 'FRONTEND',
      ),
      Requirement(
        name: 'DESIGN',
      ),
      Requirement(
        name: 'WEB DEV',
      ),
      Requirement(
        name: 'HACKATHON',
      ),
      Requirement(
        name: 'PAIR PROGRAMMING',
      ),
    ]
        .where((lang) => lang.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
