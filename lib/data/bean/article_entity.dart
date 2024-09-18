import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'article_entity.g.dart';

@JsonSerializable()
class ArticleData {
  late int curPage;
  late List<ArticleDataDatas> datas;
  late int offset;
  late bool over;
  late int pageCount;
  late int size;
  late int total;

  ArticleData();

  factory ArticleData.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleDataDatas {
  late bool adminAdd;
  late String apkLink;
  late int audit;
  late String author;
  late bool canEdit;
  late int chapterId;
  late String chapterName;
  late bool collect;
  late int courseId;
  late String desc;
  late String descMd;
  late String envelopePic;
  late bool fresh;
  late String host;
  late int id;
  late bool isAdminAdd;
  late String link;
  late String niceDate;
  late String niceShareDate;
  late String origin;
  late String prefix;
  late String projectLink;
  late int publishTime;
  late int realSuperChapterId;
  late int selfVisible;
  late int shareDate;
  late String shareUser;
  late int superChapterId;
  late String superChapterName;
  late List<dynamic> tags;
  late String title;
  late int type;
  late int userId;
  late int visible;
  late int zan;

  ArticleDataDatas();

  factory ArticleDataDatas.fromJson(Map<String, dynamic> json) =>
      _$ArticleDataDatasFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
