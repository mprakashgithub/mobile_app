import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/const_colors.dart';

class CommonScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final Widget? titleWidget;
  final PreferredSizeWidget? customAppBar;
  // final bool isTitleWithBackButton;
  // final List<Widget>? titleActionsWidgets;
  final bool centerTitle;
  final Widget? leading;
  final List<Widget>? actions;
  // final double? elevation;
  final double? titleSpacing;
  final ShapeBorder? shape;
  final Widget? drawer;
  final EdgeInsetsGeometry bodyPadding;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool? onWillPop;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool automaticallyImplyLeading;
  final Key? appKey;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final bool? resizeToAvoidBottomInset;
  final bool safeAreaLeft;
  final bool safeAreaTop;
  final bool safeAreaRight;
  final bool safeAreaBottom;
  final EdgeInsets safeAreaMinimum;
  final bool safeAreaMaintainBottomViewPadding;
  final Widget? bottomSheet;

  const CommonScaffold({
    super.key,
    this.title,
    required this.body,
    this.leading,
    this.actions,
    this.bodyPadding = EdgeInsets.zero,
    this.centerTitle = true,
    // this.elevation,
    this.titleSpacing = 0.0,
    this.shape,
    this.drawer,
    this.titleWidget,
    this.customAppBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.onWillPop,
    this.backgroundColor,
    this.automaticallyImplyLeading = true,
    // this.isTitleWithBackButton = false,
    // this.titleActionsWidgets,
    this.systemOverlayStyle,
    this.resizeToAvoidBottomInset,
    this.appKey,
    this.safeAreaLeft = false,
    this.safeAreaTop = false,
    this.safeAreaRight = false,
    this.safeAreaBottom = false,
    this.safeAreaMinimum = EdgeInsets.zero,
    this.safeAreaMaintainBottomViewPadding = false,
    this.bottomSheet,
  });

  @override
  Widget build(BuildContext context) {
    // setCustomStatusBarColor();
    return PopScope(
      canPop: onWillPop ?? false,
      child: Scaffold(
        key: key,
        bottomSheet: bottomSheet,
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: customAppBar ??
            ((leading != null ||
                    titleWidget != null ||
                    title != null ||
                    actions != null)
                ? AppBar(
                    key: appKey,
                    leading: leading,
                    automaticallyImplyLeading: automaticallyImplyLeading,
                    flexibleSpace: Container(
                        decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ConstColors.blue_tab,
                            ConstColors.blue_tab,
                            ConstColors.gradient_green
                          ]),
                    )),
                    titleSpacing: titleSpacing,
                    title: titleWidget ??
                        Text(
                          title ?? "",
                          // style: ConstTextStyles.textWhiteAppBar,
                        ),
                    actions: actions,
                    centerTitle: centerTitle,
                    // elevation: elevation ?? 0.0,
                    systemOverlayStyle:
                        systemOverlayStyle ?? SystemUiOverlayStyle.light,
                  )
                : null),
        drawer: drawer,
        body: SafeArea(
          top: safeAreaTop,
          bottom: safeAreaBottom,
          left: safeAreaLeft,
          right: safeAreaRight,
          minimum: safeAreaMinimum,
          maintainBottomViewPadding: safeAreaMaintainBottomViewPadding,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            child: Padding(
              padding: bodyPadding,
              child: Column(
                children: [
                  // ConnectivityStateBuilder(
                  //   builder: (result) {
                  //     return Obx(() {
                  //       return DataSyncStatusBarWidget(
                  //         dataSyncBarStatus:
                  //             result.value == ConnectivityResult.none
                  //                 ? DataSyncBarStatus.isOffline
                  //                 : DataSyncBarStatus.hidden,
                  //       );
                  //     });
                  //   },
                  // ),
                  Expanded(
                    child: body,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
