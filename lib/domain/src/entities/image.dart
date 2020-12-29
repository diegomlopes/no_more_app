import 'package:flutter/material.dart';

class Image {
  String url;
  String optionExpected;

  Image({
    @required url, 
    optionExpected
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      url: json["url"],
      optionExpected: json['optionExpected']);
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'optionExpected': optionExpected,
      
    };
  }
}

enum ImageOption {
  NoMore, More
}