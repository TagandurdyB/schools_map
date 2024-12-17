import 'package:flutter/material.dart';
import 'package:schools_map/config/core/exports.dart';
import 'package:schools_map/config/theme/styles.dart';

class Texts {
  StylesSheme style;
  Texts(this.style);

  Text heading1(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style:
            style.heading1.copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text heading2(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style:
            style.heading2.copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text heading3(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style:
            style.heading3.copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text bodyText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    double? h,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.bodyText
            .copyWith(color: col, fontSize: size, fontWeight: fw, height: h),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text bodyTextBold(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.bodyTextBold
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text buttonText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.buttonText
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text buttonTextSecondary(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.buttonTextSecondary
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text title(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.title.copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text captionText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.captionText
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text emphasizedText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.emphasizedText
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text highlightedLinkText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.highlightedLinkText.copyWith(
            color: col, fontSize: size, fontWeight: fw, decorationColor: col),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text linkText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style:
            style.linkText.copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text smallBodyText(String text,
          {Color? col,
          TextAlign? align,
          int? maxLines,
          double? size,
          FontWeight? fw}) =>
      Text(
        text,
        style: style.smallBodyText
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text tinyCaptionText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.tinyCaptionText.copyWith(
          color: col,
          fontSize: size,
          fontWeight: fw,
        ),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text tinyLinkText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.tinyLinkText
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  Text lineThroughText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
  }) =>
      Text(
        text,
        style: style.lineThroughText
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        textAlign: align,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      );

  RichText richText(
    InlineSpan child, {
    TextAlign? align,
    int? maxLines,
    TextOverflow overflow = TextOverflow.clip,
  }) =>
      RichText(
        text: child,
        overflow: overflow,
        maxLines: maxLines,
        textAlign: align ?? TextAlign.start,
      );

  TextSpan spanText(
    String text, {
    Color? col,
    TextAlign? align,
    int? maxLines,
    double? size,
    FontWeight? fw,
    List<InlineSpan>? children,
    TextStyle? textStlee,
  }) =>
      TextSpan(
        text: text,
        style: (textStlee ?? style.bodyText)
            .copyWith(color: col, fontSize: size, fontWeight: fw),
        children: children,
      );
}
