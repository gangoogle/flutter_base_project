///处理异常
Map<String, dynamic> handleResult(Map<String, dynamic>? json) {
  if (json == null) {
    throw Exception('请求错误');
  }
  if (json.isEmpty) {
    throw Exception('请求错误');
  }
  var code = json['errorCode'];
  if (code != 0) {
    if (json.containsKey('errorMsg')) {
      throw Exception(json['errorMsg']);
    } else {
      throw Exception('请求错误');
    }
  }
  return json['data'];
}
