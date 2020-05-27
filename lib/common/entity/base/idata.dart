/// 数据接口
abstract class IData<T> {
  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
