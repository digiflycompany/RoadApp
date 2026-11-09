import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roadapp/core/helpers/localization/app_localization.dart';
import 'package:roadapp/core/helpers/navigation/navigation.dart';
import 'package:roadapp/core/helpers/app_assets.dart';
import 'package:roadapp/core/helpers/string_manager.dart';
import 'package:roadapp/core/widgets/custom_alert_dialog.dart';
import 'package:roadapp/features/account/presentation/manager/account_cubit.dart';
import 'package:roadapp/features/account/presentation/manager/account_state.dart';
import 'package:roadapp/features/account/presentation/views/screens/account_settings_screen.dart';
import 'package:roadapp/features/my_maintenance_centers/presentation/views/screens/my_maintenance_centers.dart';
import 'package:roadapp/features/business_models/presentation/views/screens/business_models_screen.dart';
import 'package:roadapp/features/calendar/presentation/views/screens/calender_screen.dart';
import 'package:roadapp/features/layout/presentation/views/widgets/logout_alert_dialog.dart';
import 'package:roadapp/features/products_guide/views/screens/products_services_screen.dart';
import 'package:roadapp/features/vendor_reservations_management/presentation/view/screens/vendor_reservations_management_screen.dart';
import 'package:roadapp/features/work_reports/presentation/views/screens/work_reports_screen.dart';
import '../../../../contact_us/views/screens/contact_us_screen.dart';
import '../../../../work_reports/presentation/views/screens/work_section_screen.dart';

class VendorDrawer extends StatefulWidget {
  const VendorDrawer({super.key});

  @override
  State<VendorDrawer> createState() => _VendorDrawerState();
}

class _VendorDrawerState extends State<VendorDrawer>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final AnimationController _bounceController;
  late final Animation<double> _bounceAnimation;

  bool _showScrollHint = false;

  @override
  void initState() {
    super.initState();

    _bounceController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(begin: 0, end: 6).animate(
      CurvedAnimation(parent: _bounceController, curve: Curves.easeInOut),
    );

    _scrollController.addListener(_updateScrollHint);

    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollHint());
  }

  void _updateScrollHint() {
    if (!_scrollController.hasClients) return;

    final position = _scrollController.position;
    final hasMoreBelow = position.maxScrollExtent > 0 &&
        position.pixels < position.maxScrollExtent - 12;

    if (hasMoreBelow != _showScrollHint) {
      setState(() => _showScrollHint = hasMoreBelow);
    }
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_updateScrollHint);
    _scrollController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bgColor =
        theme.drawerTheme.backgroundColor ?? theme.scaffoldBackgroundColor;

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  thickness: 3.w,
                  radius: Radius.circular(10.r),
                  child: NotificationListener<ScrollMetricsNotification>(
                    onNotification: (_) {
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => _updateScrollHint());
                      return false;
                    },
                    child: ListView(
                      controller: _scrollController,
                      padding: EdgeInsets.zero,
                      children: [
                        // Profile Settings
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.settingsIcon),
                          title: Text(
                            StringManager.profileSettings.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const AccountSettingsScreen(),
                            );
                          },
                        ),

                        // Services Profile
                        BlocBuilder<AccountCubit, AccountState>(
                          builder: (context, state) {
                            return ListTile(
                              leading: _buildDrawerIcon(AppAssets.settingsIcon),
                              title: Text(
                                StringManager.servicesProfile.tr(context),
                                style: TextStyle(fontSize: 16.sp),
                              ),
                              onTap: () {
                                final cubit = AccountCubit.get(context);

                                cubit.fetchAccount();
                                cubit.fetchMaintenanceServiceType();
                                cubit.fetchProductType();

                                if (cubit.userData?.user != null) {
                                  AppNavigation.navigate(
                                    const MyMaintenanceCenters(),
                                  );
                                }
                              },
                            );
                          },
                        ),

                        // Work Models
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.documentIcon),
                          title: Text(
                            StringManager.workModels.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const BusinessModelsScreen(),
                            );
                          },
                        ),

                        // Work Reports Section
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.documentIcon),
                          title: Text(
                            StringManager.workReports.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const WorkSectionScreen(),
                            );
                          },
                        ),

                        // Reservations and Notifications Management
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.alarmIcon),
                          title: Text(
                            StringManager.reservationsAndNotificationsManagement
                                .tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const VendorReservationsManagementScreen(),
                            );
                          },
                        ),

                        // Time Schedule Note
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.writingIcon),
                          title: Text(
                            StringManager.timeScheduleNote.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const CalenderScreen(),
                            );
                          },
                        ),

                        // Services and Products Guide
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.guideIcon),
                          title: Text(
                            StringManager.servicesAndProductsGuide.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const ProductsServicesScreen(),
                            );
                          },
                        ),

                        // Work Reports
                        ListTile(
                          leading: _buildDrawerIcon(AppAssets.documentIcon),
                          title: Text(
                            StringManager.workReports.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const WorkReportsScreen(),
                            );
                          },
                        ),

                        // Contact Us
                        ListTile(
                          leading: _buildDrawerIcon(
                            AppAssets.contactIcon,
                            width: 15.w,
                          ),
                          title: Text(
                            StringManager.contactUs.tr(context),
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          onTap: () {
                            AppNavigation.navigate(
                              const ContactUsScreen(),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: IgnorePointer(
                    ignoring: !_showScrollHint,
                    child: AnimatedOpacity(
                      opacity: _showScrollHint ? 1 : 0,
                      duration: const Duration(milliseconds: 250),
                      child: _buildScrollHint(bgColor),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Logout - Fixed at the bottom
          const Divider(height: 1),
          ListTile(
            leading: _buildDrawerIcon(AppAssets.logoutIcon),
            title: Text(
              StringManager.logout.tr(context),
            ),
            onTap: () {
              showCustomAlertDialog(
                context: context,
                title: StringManager.alert.tr(context),
                content: const LogoutALerDialog(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScrollHint(Color bgColor) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _scrollToBottom,
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              bgColor.withOpacity(0),
              bgColor.withOpacity(0.9),
              bgColor,
            ],
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 4.h),
        child: AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _bounceAnimation.value),
              child: child,
            );
          },
          child: Icon(
            Icons.keyboard_double_arrow_down_rounded,
            size: 22.sp,
            color: Colors.grey.shade600,
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerIcon(
    String asset, {
    double? width,
  }) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.black,
      ),
      child: SvgPicture.asset(
        asset,
        width: width ?? 20.w,
      ),
    );
  }
}
