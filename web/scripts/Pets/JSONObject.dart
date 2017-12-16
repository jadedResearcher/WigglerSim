/*
    should be a wrapper for a map.
    new JsonObject.fromJsonString(json); should be implemented.
 */
import 'dart:collection';

class JSONObject extends Object with MapMixin<String,String>{
    Map<String, String> json = new Map<String,String>();
    JSONObject();
    JSONObject.fromJSONString(String json){
        throw ("TODO implement making a hash from a JSON string");
    }

  @override
  String operator [](Object key) {
    return json[key];
  }

  @override
  void operator []=(String key, String value) {
    json[key] = value;
  }

  @override
  void clear() {
    json.clear();
  }

  @override
  Iterable<String> get keys => json.keys;

  @override
  String remove(Object key) {
   json.remove(key);
  }
}