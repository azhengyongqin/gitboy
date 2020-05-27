import 'idata.dart';

class BaseResponse<T extends IData> {
  String errcode;
  String errmsg;
  T data;

  BaseResponse({
    this.errcode,
    this.errmsg,
    this.data,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json, {T data}) => BaseResponse(
        errcode: json["errcode"],
        errmsg: json["errmsg"],
        data: data?.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "errcode": this.errcode,
        "errmsg": this.errmsg,
        "data": this.data.toJson(),
      };
}
