import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

String duMD5(String str) {
  var digest = md5.convert(Utf8Encoder().convert(str));
  return hex.encode(digest.bytes);
}
