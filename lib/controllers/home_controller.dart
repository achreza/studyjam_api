import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:studyjam_api/models/meme_model.dart';

class HomeController extends GetxController {
  var isFetching = true.obs;

  MemeModel? model;

  Future<MemeModel> ambilData() async {
    Dio dio = Dio();
    var res = await dio.get("https://api.imgflip.com/get_memes");
    MemeModel model = MemeModel.fromJson(res.data);

    return model;
  }

  void fetchData() async {
    model = await ambilData();
    isFetching.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
}
