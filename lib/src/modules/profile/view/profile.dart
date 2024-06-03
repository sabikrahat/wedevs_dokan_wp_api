import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../config/constants.dart';
import '../provider/profile.dart';

import '../../../config/custom.routes.dart';
import '../../../utils/extensions/extensions.dart';
import '../../settings/view/setting.view.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(profileProvider).when(
        loading: riverpodLoading,
        error: riverpodError,
        data: (data) {
          final notifier = ref.watch(profileProvider.notifier);
          return SingleChildScrollView(
            child: Column(
              children: [
                AppBar(
                  elevation: 0.0,
                  backgroundColor: context.theme.scaffoldBackgroundColor,
                  surfaceTintColor: context.theme.scaffoldBackgroundColor,
                  shadowColor: Colors.transparent,
                  title: Text('My Account', style: context.text.headlineSmall),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: () async =>
                          await fadePush(context, const SettingsView()),
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 30.0,
                        color: context.theme.textTheme.labelLarge!.color,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30.0),
                DottedBorder(
                  borderType: BorderType.Circle,
                  color: context.theme.primaryColor.withOpacity(0.7),
                  dashPattern: const [5, 5],
                  strokeWidth: 2.0,
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: borderRadius100,
                    child: Image.asset(
                      'assets/images/avatar.png',
                      width: 110.0,
                      height: 110.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Text(
                  notifier.profile?.name ?? 'No name',
                  style: context.text.headlineSmall,
                ),
                Text(
                  notifier.profile?.email ?? 'No email',
                  style: context.text.titleMedium!.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 30.0),
                Material(
                  elevation: 5.0,
                  color: context.theme.cardColor,
                  shape: roundedRectangleBorder12,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: borderRadius12,
                    ),
                    child: Column(
                      children: [
                        const InfoSection(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: context.theme.disabledColor,
                            thickness: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Theme(
                          data: context.theme
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            leading: SvgPicture.asset(
                              'assets/svgs/password.svg',
                              width: 25.0,
                              height: 25.0,
                            ),
                            title: Text(
                              'Passwords',
                              style: context.text.titleLarge!.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16.0,
                              color: context.theme.textTheme.bodyMedium!.color,
                            ),
                            onExpansionChanged: (v) {
                              if (!v) return;
                              EasyLoading.showToast(
                                'will be implemented soon',
                                toastPosition: EasyLoadingToastPosition.bottom,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: context.theme.disabledColor,
                            thickness: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Theme(
                          data: context.theme
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            leading: SvgPicture.asset(
                              'assets/svgs/notification.svg',
                              width: 25.0,
                              height: 25.0,
                            ),
                            title: Text(
                              'Notification',
                              style: context.text.titleLarge!.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16.0,
                              color: context.theme.textTheme.bodyMedium!.color,
                            ),
                            onExpansionChanged: (v) {
                              if (!v) return;
                              EasyLoading.showToast(
                                'will be implemented soon',
                                toastPosition: EasyLoadingToastPosition.bottom,
                              );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(
                            color: context.theme.disabledColor,
                            thickness: 0.3,
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Theme(
                          data: context.theme
                              .copyWith(dividerColor: Colors.transparent),
                          child: ExpansionTile(
                            leading: SvgPicture.asset(
                              'assets/svgs/wishlist.svg',
                              width: 25.0,
                              height: 25.0,
                            ),
                            title: Text(
                              'Wishlist (00)',
                              style: context.text.titleLarge!.copyWith(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16.0,
                              color: context.theme.textTheme.bodyMedium!.color,
                            ),
                            onExpansionChanged: (v) {
                              if (!v) return;
                              EasyLoading.showToast(
                                'will be implemented soon',
                                toastPosition: EasyLoadingToastPosition.bottom,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

class InfoSection extends ConsumerWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(profileProvider);
    final notifier = ref.read(profileProvider.notifier);
    return Theme(
      data: context.theme.copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        controller: notifier.expansionTileCntrlr,
        initiallyExpanded: notifier.isProfileExpanded,
        onExpansionChanged: (v) => notifier.toggleProfileExpansion(),
        trailing: notifier.isProfileExpanded
            ? Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 24.0,
                color: context.theme.textTheme.bodyMedium!.color,
              )
            : Icon(
                Icons.arrow_forward_ios_rounded,
                size: 16.0,
                color: context.theme.textTheme.bodyMedium!.color,
              ),
        leading: SvgPicture.asset(
          'assets/svgs/person.svg',
          width: 25.0,
          height: 25.0,
        ),
        title: Text(
          'Account',
          style: context.text.titleLarge!.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        children: [
          Form(
            key: notifier.formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: crossStart,
                children: [
                  Text(
                    'Email',
                    style: context.text.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: notifier.emailCntrlr,
                    decoration: _border(context, 'youremail@example.com'),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    'Full Name',
                    style: context.text.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: notifier.nameCntrlr,
                    decoration: _border(context, 'William Bennett'),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    'Street Address',
                    style: context.text.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: notifier.addressCntrlr,
                    decoration:
                        _border(context, '465 Nolan Causeway Suite 079'),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    'Apt, Suite, Bldg (optional)',
                    style: context.text.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: notifier.buildingCntrlr,
                    decoration: _border(context, 'Unit 512'),
                  ),
                  const SizedBox(height: 25.0),
                  Text(
                    'Zip Code',
                    style: context.text.titleMedium,
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: notifier.zipCntrlr,
                    decoration: _border(context, '77017'),
                  ),
                  const SizedBox(height: 40.0),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: context.theme.disabledColor,
                            side:
                                BorderSide(color: context.theme.disabledColor),
                          ),
                          onPressed: () =>
                              notifier.expansionTileCntrlr.collapse(),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1ABC9C),
                          ),
                          onPressed: () async {
                            await notifier.updateProfile(context);
                            notifier.expansionTileCntrlr.collapse();
                          },
                          child: const Text('Apply'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _border(BuildContext context, [String? hintText]) {
    return InputDecoration(
      hintText: hintText,
      border: OutlineInputBorder(
        borderRadius: borderRadius12,
        borderSide: BorderSide(color: context.theme.disabledColor, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: borderRadius12,
        borderSide: BorderSide(color: context.theme.disabledColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: borderRadius12,
        borderSide: BorderSide(color: context.theme.disabledColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: borderRadius12,
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
    );
  }
}
