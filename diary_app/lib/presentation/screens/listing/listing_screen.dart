import 'package:diary_app/data/enums/appbar_type_enum.dart';
import 'package:diary_app/domain/controllers/screen_controllers/listing_screen_controller.dart';
import 'package:diary_app/presentation/global_components/appbar/appbar_widget.dart';
import 'package:diary_app/presentation/layouts/main_layout.dart';
import 'package:diary_app/presentation/screens/listing/content_detail_screen/content_detail_screen.dart';
import 'package:diary_app/presentation/screens/listing/widgets/content_widget.dart';
import 'package:diary_app/resources/file_paths/icons.dart';
import 'package:diary_app/resources/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListingScreen extends StatelessWidget {
  const ListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ListingScreenController listingScreenController =
        Get.put(ListingScreenController());
    return SafeArea(
      child: MainLayout(
          appBar: const CustomAppBar(
            appbarType: AppbarType.withLeading,
            leadingIcon: AppIcons.glasses,
            iconColor: AppColors.teal,
          ),
          content: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView.builder(
              itemCount: listingScreenController.contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final item = listingScreenController.contentList[index];
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(PageRouteBuilder(
                      transitionDuration: const Duration(seconds: 1),
                      reverseTransitionDuration: const Duration(seconds: 1),
                      pageBuilder: (_, __, ___) =>
                          ContentDetailScreen(content: item))),
                  child: Hero(
                    tag: 'content-${item.id}',
                    child: Material(
                      type: MaterialType.transparency,
                      child: ContentWidget(
                        title: item.title ?? '',
                        date: item.date ?? DateTime.now(),
                        image: item.image ?? '',
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    );
  }
}
