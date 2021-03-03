import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Controller.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CounterController hmeController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GetX - 30Days 100 Hot Project for Dart'),
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              return await hmeController.reset();
            },
            child: Obx(
              () => ListView.builder(
                controller: hmeController.scrollController,
                itemCount: hmeController.data.length,
                itemBuilder: (context, int index) {
                  final data = hmeController.data;
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                            '${data[index]["username"]}/${data[index]["reponame"]}'),
                        subtitle: Text('${data[index]["description"]}'),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            // /
                            RowContainer().builder(
                                Icons.star, '${data[index]["starCount"]}'),
                            RowContainer().builder(Icons.golf_course,
                                '${data[index]["forkCount"]}'),
                            InkWell(
                              child: RowContainer()
                                  .builder(Icons.arrow_right, "查看"),
                              onTap: () {
                                Get.toNamed('/second',
                                    arguments: UModel(
                                        data[index]["owner"]["url"],
                                        data[index]["reponame"]));
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )));
  }
}

class RowContainer {
  Widget builder(icon, subText) {
    return Container(
      width: 100,
      child: Row(
        children: [Icon(icon), Text(subText)],
      ),
    );
  }
}

class UModel {
  String url;
  String title;
  UModel(this.url, this.title);
}
