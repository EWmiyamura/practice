import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp());
}

class GithubRepository {
  /// Repository full name.
  final String fullName;

  /// Repository description.
  final String description;

  /// Language in use.
  final String language;

  /// Repository html url.
  final String htmlUrl;

  ///Count of stars.
  final int stargazersCount;

  ///Count of watchers.
  final int watchersCount;

  ///Count of forks repository.
  final int forksCount;

  GithubRepository.fromJson(Map<String, dynamic> json)
      : fullName = json['full_name'],
        description = json['description'],
        language = json['language'],
        htmlUrl = json['html_url'],
        stargazersCount = json['stargazers_count'],
        watchersCount = json['watchers_count'],
        forksCount = json['forks_count'];
}

Widget_buildInput() {
  return Container(
      margin: EdgeInsets.all(16.0),
      child: TextFirld(
        decoraton: InputDecoration(
            prefixIcon: Icon(Icon, search),
            hintText: 'Please enter a search repository name',
            labelText: "search"),
        onChanged: (inputString) {
          if (inputString.length >= 5) {
            _searchRepositories(inputString).then((repositories) {
              setState(() {
                _repositories = repositories;
              });
            });
          }
        },
      ));
}
