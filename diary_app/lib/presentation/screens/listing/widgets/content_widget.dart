import 'package:diary_app/presentation/global_components/image_asset.dart';
import 'package:diary_app/presentation/global_components/texts/custom_text.dart';
import 'package:diary_app/resources/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget(
      {super.key,
      required this.title,
      required this.date,
      required this.image});
  final String title;
  final String image;
  final DateTime date;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: ImageAsset(
              height: 200,
              width: Get.width,
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 20,
              left: 20,
              child: CustomText(
                '${DateFormat('dd').format(date)} \n ${DateFormat('MMMM').format(date)}',
                style: AppTextStyle.h5(),
              )),
          Positioned(
              bottom: 20,
              right: 20,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Get.width * 0.7),
                child: CustomText(
                  title,
                  textAlign: TextAlign.right,
                  maxLines: 2,
                  style: AppTextStyle.h4(),
                ),
              ))
        ],
      ),
    );
  }
}
