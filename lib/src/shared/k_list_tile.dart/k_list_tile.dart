import 'package:flutter/material.dart';

import '../../config/constants.dart';
import '../../utils/extensions/extensions.dart';

class KListTile extends StatelessWidget {
  const KListTile({
    super.key,
    this.onTap,
    this.title,
    this.leading,
    this.padding,
    this.trailing,
    this.subtitle,
    this.selected,
    this.onDoubleTap,
    this.onLongPress,
    this.paddingBetweenTitleAndSubtitle,
  });

  final Widget? title;
  final bool? selected;
  final Widget? leading;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final double? paddingBetweenTitleAndSubtitle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: context.theme.primaryColor.withOpacity(0.2),
      splashColor: context.theme.primaryColor.withOpacity(0.5),
      borderRadius: borderRadius15,
      radius: 30,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: key == null
          ? _Tile(
              selected: selected,
              padding: padding,
              leading: leading,
              title: title,
              subtitle: subtitle,
              paddingBetweenTitleAndSubtitle: paddingBetweenTitleAndSubtitle,
              trailing: trailing,
            )
          : _Tile(
              selected: selected,
              padding: padding,
              leading: leading,
              title: title,
              subtitle: subtitle,
              paddingBetweenTitleAndSubtitle: paddingBetweenTitleAndSubtitle,
              trailing: trailing,
            ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    required this.selected,
    required this.padding,
    required this.leading,
    required this.title,
    required this.subtitle,
    required this.paddingBetweenTitleAndSubtitle,
    required this.trailing,
  });

  final bool? selected;
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final double? paddingBetweenTitleAndSubtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected == true
            ? context.theme.primaryColor.withOpacity(0.2)
            : null,
        borderRadius: borderRadius15,
      ),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
        child: Row(
          mainAxisAlignment: mainCenter,
          children: [
            leading ?? const SizedBox.shrink(),
            const SizedBox(width: 10),
            Expanded(
              flex: 9,
              child: Column(
                mainAxisSize: mainMin,
                crossAxisAlignment: crossStart,
                children: [
                  title ?? const SizedBox.shrink(),
                  if (subtitle != null)
                    SizedBox(height: paddingBetweenTitleAndSubtitle ?? 2.0),
                  subtitle ?? const SizedBox.shrink(),
                ],
              ),
            ),
            const Expanded(child: SizedBox.shrink()),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
