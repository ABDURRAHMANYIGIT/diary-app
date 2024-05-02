import 'package:diary_app/data/models/content.dart';
import 'package:diary_app/resources/dummy_data/dummy_contents.dart';
import 'package:get/get.dart';

class ListingScreenController extends GetxController {
  final List<ContentObject> contentList = DummyContent.contentList;
}
