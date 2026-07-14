import 'package:first_project/data/bean/article_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('article API payload can be serialized and deserialized', () {
    final item = <String, Object>{
      'adminAdd': false,
      'apkLink': '',
      'audit': 1,
      'author': 'author',
      'canEdit': false,
      'chapterId': 1,
      'chapterName': 'chapter',
      'collect': false,
      'courseId': 1,
      'desc': '',
      'descMd': '',
      'envelopePic': '',
      'fresh': true,
      'host': '',
      'id': 42,
      'isAdminAdd': false,
      'link': 'https://example.test/article',
      'niceDate': 'now',
      'niceShareDate': 'now',
      'origin': '',
      'prefix': '',
      'projectLink': '',
      'publishTime': 1,
      'realSuperChapterId': 1,
      'selfVisible': 0,
      'shareDate': 1,
      'shareUser': '',
      'superChapterId': 1,
      'superChapterName': 'super',
      'tags': <Object>[],
      'title': 'A title',
      'type': 0,
      'userId': 1,
      'visible': 1,
      'zan': 0,
    };
    final payload = <String, Object>{
      'curPage': 1,
      'datas': [item],
      'offset': 0,
      'over': false,
      'pageCount': 1,
      'size': 20,
      'total': 1,
    };

    final article = ArticleData.fromJson(payload);
    expect(article.datas.single.id, 42);
    expect(article.datas.single.title, 'A title');
    expect(article.toJson()['total'], 1);
  });
}
