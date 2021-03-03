import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './pages/Home/View.dart';
import './pages/Secound/View.dart';

Future<void> main() async {
  await initServices();

  /// 等待服务初始化.
  runApp(GetMaterialApp(
    initialRoute: '/',
    enableLog: true,
    logWriterCallback: localLogWriter,
    getPages: [
      GetPage(name: '/', page: () => Home()),
      GetPage(
          name: '/second',
          transition: Transition.zoom,
          page: () => ScreenPage()),
    ],
  ));
}

void localLogWriter(String text, {bool isError = false}) {
  // 在这里把信息传递给你最喜欢的日志包。
  // 请注意，即使enableLog: false，日志信息也会在这个回调中被推送。
  // 如果你想的话，可以通过GetConfig.isLogEnable来检查这个标志。
  print(text);
}

/// 在你运行Flutter应用之前，让你的服务初始化是一个明智之举。
////因为你可以控制执行流程（也许你需要加载一些主题配置，apiKey，由用户自定义的语言等，所以在运行ApiService之前加载SettingService。
///所以GetMaterialApp()不需要重建，可以直接取值。
Future<void> initServices() async {
  print('starting services ...');

  ///这里是你放get_storage、hive、shared_pref初始化的地方。
  ///或者moor连接，或者其他什么异步的东西。
  await Get.putAsync(() => DbService().init());
  await Get.putAsync(() => SettingsService().init());
  print('All services started...');
}

class DbService extends GetxService {
  Future<DbService> init() async {
    print('$runtimeType delays 2 sec');
    await 2.delay();
    print('$runtimeType ready!');
    return this;
  }
}

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    print('$runtimeType delays 1 sec');
    await 1.delay();
    print('$runtimeType ready!');
    return this;
  }
}
