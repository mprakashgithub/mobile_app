import 'package:flutter/material.dart';
import 'package:mobile_app/utils/utils.dart';

class MallInfo extends StatefulWidget {
  const MallInfo({super.key});
  static const String id = "/MallInfo";

  @override
  State<MallInfo> createState() => _MallInfoState();
}

class _MallInfoState extends State<MallInfo> {
  // final MainpageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mall info"),
        actions: [
          IconButton(
              onPressed: () {
                pushNamed(MallInfo.id);
              },
              icon: const Icon(Icons.arrow_right))
        ],
      ),
      body: Text("Heyy"),
      // body: Obx(
      //   () => SizedBox(
      //     width: MediaQuery.of(context).size.width,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(AppLocalizations.trans("label_language")),
      //         // Text(controller.count.value.toString()),
      //         // MaterialButton(
      //         //     onPressed: () {
      //         //       controller.increaseCount();
      //         //     },
      //         //     color: Colors.amber,
      //         //     child: const Icon(Icons.add))
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
