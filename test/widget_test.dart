import 'package:dio/dio.dart';

void main() {
  ambilData();
}

void ambilData() async {
  Dio dio = Dio();
  var res = await dio.get("https://api.imgflip.com/get_memes");
  print(res.data);
}
