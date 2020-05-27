import 'idata.dart';

/// 基础请求
class BaseRequest<T extends IData> {
  String accessToken;
  String type;
  T data;

  BaseRequest({
    this.accessToken,
    this.type,
    this.data,
  });

  factory BaseRequest.fromJson(Map<String, dynamic> json, {T data}) {
    return BaseRequest(
      accessToken: json["access_token"],
      type: json["type"],
      data: data?.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        'access_token': this.accessToken,
        'type': this.type,
        'data': this.data.toJson(),
      };

  @override
  String toString() {
    return 'BaseRequest{accessToken: $accessToken, type: $type, data: ${data.toString()}';
  }
}
