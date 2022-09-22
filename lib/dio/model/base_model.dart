import 'package:json2dart_safe/json2dart.dart';

import 'entity_factory.dart';

class BaseModel<T> {
  ///返回响应码
  var code = 200;

  ///返回消息内容
  var message = '';

  ///返回对象
  T? data;

  ///返回列表
  List<T> listData = [];

  BaseModel(this.code, this.message, this.data);

  BaseModel.fromJson(Map<String, dynamic> json) {
    code = json.asInt('code');
    message = json.asString('message');
    var data = json['data'];
    if (data is List) {
      for (var item in data) {
        listData.add(_generateOBJ(item));
      }
    } else {
      data = _generateOBJ(data);
    }
  }

  V? _generateOBJ<V>(json) {
    if (V.toString() == 'String') {
      return json.toString() as V;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      if (json != null) {
        return json as V;
      }
      return null;
    } else {
      return EntityFactory.generateOBJ(json);
    }
  }
}
