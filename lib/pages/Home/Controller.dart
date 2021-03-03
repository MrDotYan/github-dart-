import 'package:get/get.dart';
import '../../utils/httpUtils.dart';
import 'package:flutter/material.dart';

class CounterController extends GetxController {
  HttpUtils http = new HttpUtils();
  RxInt limit = 100.obs;
  RxInt offset = 0.obs;
  RxList data = [].obs;
  ScrollController scrollController = new ScrollController();
  RxBool isLoading = false.obs;

  RxList imageList = [].obs;

  Future getGithub() async {
    if (!isLoading.value) {
      isLoading.value = true;
      return await http.post('https://e.xitu.io/resources/github', {
        "category": "upcome",
        "lang": "dart",
        "limit": limit,
        "offset": offset.value * (limit.value),
        "period": "month",
      }).then((resp) {
        if (resp['code'] == 200) {
          if (resp['data'].length != 0) {
            data.addAll(resp['data']);
            offset++;
            isLoading.value = false;
          }
        }
      }).catchError((error) {
        print(error);
      });
    }
  }

  void onScroll() {
    scrollController.addListener(() {
      final offset = scrollController.offset;
      final maxOffset = scrollController.position.maxScrollExtent;

      if (offset == maxOffset) {
        getGithub();
      }
    });
  }

  Future reset() async {
    offset.value = 0;
    isLoading.value = false;
    data = [].obs;

    return getGithub();
  }

  void onInit() {
    getGithub();
    onScroll();
    super.onInit();
  }

  void onClose() {
    super.onClose();
  }
}
