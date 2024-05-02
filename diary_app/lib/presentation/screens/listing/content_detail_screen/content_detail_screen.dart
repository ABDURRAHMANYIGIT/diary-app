import 'package:diary_app/data/models/content.dart';
import 'package:diary_app/domain/controllers/screen_controllers/content_detail_screen_controller.dart';
import 'package:diary_app/presentation/global_components/image_asset.dart';
import 'package:diary_app/presentation/global_components/texts/custom_text.dart';
import 'package:diary_app/resources/styles/colors.dart';
import 'package:diary_app/resources/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ContentDetailScreen extends StatelessWidget {
  const ContentDetailScreen({super.key, required this.content});
  final ContentObject content;
  @override
  Widget build(BuildContext context) {
    final ContentDetailScreenController screenController =
        Get.put(ContentDetailScreenController());
    return Hero(
      tag: 'content-${content.id}',
      child: Material(
        color: AppColors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: screenController.scrollController,
              child: ClipRRect(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(200),
                          bottomRight: Radius.circular(200)),
                      child: ImageAsset(
                        content.image!,
                        height: Get.height * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          CustomText(
                            content.title!,
                            maxLines: null,
                            textOverflow: TextOverflow.visible,
                            style: AppTextStyle.h4(
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomText(
                            content.article!,
                            maxLines: null,
                            textAlign: TextAlign.left,
                            textOverflow: TextOverflow.visible,
                            style: AppTextStyle.bodyLarge(
                              color: AppColors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: kBottomNavigationBarHeight * 1.5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: AppColors.white,
                width: Get.width,
                child: Obx(() {
                  return Column(
                    children: [
                      LinearProgressIndicator(
                        value: screenController.scrollPercentage / 100,
                        minHeight: 4,
                        backgroundColor: AppColors.lightGrey,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.brown),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: CustomText(
                          'Save',
                          style: AppTextStyle.h5(color: AppColors.brown),
                        ),
                      )
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
