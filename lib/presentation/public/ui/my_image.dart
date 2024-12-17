import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:schools_map/config/core/exports.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as fc;

// ignore: must_be_immutable
class MyImage extends StatelessWidget {
   String? imgPath;
  final FileType type;
  final FileSource source;
  final BoxFit fit;
  final Widget? errW;
  final double? w, h;
   MyImage({
    required this.imgPath,
    this.type = FileType.network,
    this.fit = BoxFit.contain,
    this.errW,
    this.w,
    this.source = FileSource.network,
    this.h,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    try {
      if (imgPath == null || imgPath == '') return errW ?? buildErr;
      if (source.isNetwork) {
        return SizedBox(
          width: w,
          height: h,
          child: CachedNetworkImage(
              imageUrl: imgPath!,
              fadeInCurve: Curves.easeInOut,
              fit: fit,
              cacheManager: fc.CacheManager(fc.Config("images",
                  stalePeriod: const Duration(days: 15),
                  maxNrOfCacheObjects: 500)),
              // progressIndicatorBuilder: (context, url, d) {
              //   return Shimmer.fromColors(
              //       baseColor: Colors.grey[300]!,
              //       highlightColor: Colors.grey[100]!,
              //       child: Container());
              //   // if (d.totalSize == null || d.progress == null) {
              //   //   return const LoadingWidget();
              //   // } else {
              //   //   return LoadingWidget(progres: d.progress! / d.totalSize!);
              //   // }
              // },
              errorWidget: (context, url, error) => errW ?? buildErr),
        );
      } else if (source.isAsset) {
        // imgPath =imgPath!.substring(0,'assets/category_images/'.length)+Uri.encodeComponent(imgPath!.split('/').last);
        return SizedBox(
          width: w,
          height: h,
          child: Image.asset(
            imgPath!,
            fit: fit,
            width: w,
            height: h,
            errorBuilder: (context, error, stackTrace) => errW ?? buildErr,
          ),
        );
      } else if (source.isFile) {
        return SizedBox(
          width: w,
          height: h,
          child: Image.file(
            File(imgPath!),
            fit: fit,
            width: w,
            height: h,
            errorBuilder: (context, error, stackTrace) => errW ?? buildErr,
          ),
        );
      } else if (type.isMemory) {
        //TODO:
      } else if (type.isErr) {
        throw Error();
      } else if (type.isSvg) {
        return SvgPicture.asset(
          imgPath ?? Asset.svgs.newMainlogo,
          height: h,
        );
      }
    } catch (e) {
      debugPrint('+++!Error in MyImage path:=$imgPath');
      debugPrint('+++!Err:=$e');
    }
    return buildErr;
  }

  Widget get buildErr {
    // print("+++++Errimage:=$imgPath");
    return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      border: Border.all(width: 1, color: Colors.red)
    ),
    alignment: Alignment.center,
    child: const Icon(
          CuperIcons.exclamationmark_circle_fill,
          color: Colors.red,
        ),
  );}
  // Icon(Icons.hide_image_outlined); //SvgPicture.asset(Asset.cubicSvg);
}
