import 'dart:core';

import 'package:dev_connect/screens/add_post_screen.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:dev_connect/screens/add_post_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  Text('home'),
  Text('search'),
  addPostScreen(),
  Text('filter'),
  Text('profile')
];

class Requirement {
  final String? tags;
  final String? avatar;
  Requirement({this.tags, this.avatar});
}

List<Requirement> getRequirements = [
  Requirement(tags: "AI-ML", avatar: ""),
  Requirement(tags: "Project ", avatar: ""),
  Requirement(tags: "App Dev ", avatar: ""),
  Requirement(tags: "Question ", avatar: ""),
  Requirement(tags: "Backend ", avatar: ""),
  Requirement(tags: "UI/UX ", avatar: ""),
  Requirement(tags: "Help ", avatar: ""),
  Requirement(tags: "Frontend  ", avatar: "FR_1611144952.jpg"),
  Requirement(tags: "Design ", avatar: ""),
  Requirement(tags: "Web Dev  ", avatar: ""),
  Requirement(tags: "Hackathon", avatar: ""),
  Requirement(tags: "Pair Programming ", avatar: ""),
];
