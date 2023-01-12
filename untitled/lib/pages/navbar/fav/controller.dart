import 'package:get/get.dart';

class favController extends GetxController {
  RxBool isExpanded = true.obs;
  RxList lines = [].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await facth();
    print('+++===================');
    print(lines.value);
    super.onInit();
  }


  @override
  void onClose() {
    super.onClose();
  }

  facth() async {


}}