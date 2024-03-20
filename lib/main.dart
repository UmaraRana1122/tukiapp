import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/views/admin_screens/admin_login.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/edit_profile.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/login_screen.dart';
import 'package:tukiapp/views/admin_screens/auth_screens/new_password.dart';
import 'package:tukiapp/views/admin_screens/co_owner_details.dart';
import 'package:tukiapp/views/admin_screens/co_tenant_details.dart';
import 'package:tukiapp/views/admin_screens/create_event.dart';
import 'package:tukiapp/views/admin_screens/create_guard.dart';
import 'package:tukiapp/views/admin_screens/create_owner.dart';
import 'package:tukiapp/views/admin_screens/event_listing.dart';
import 'package:tukiapp/views/admin_screens/owner_details.dart';
import 'package:tukiapp/views/admin_screens/owners_listing.dart';
import 'package:tukiapp/views/admin_screens/setting_help.dart';
import 'package:tukiapp/views/admin_screens/settings.dart';
import 'package:tukiapp/views/bookings/booking_listing.dart';
import 'package:tukiapp/views/co_owners/nelson_co.dart';
import 'package:tukiapp/views/co_owners/nelson_ten.dart';
import 'package:tukiapp/views/guards_screens/all_events.dart';
import 'package:tukiapp/views/guards_screens/games_detail.dart';
import 'package:tukiapp/views/guards_screens/guard_dashboard.dart';
import 'package:tukiapp/views/guards_screens/guard_login.dart';
import 'package:tukiapp/views/guards_screens/guard_report.dart';
import 'package:tukiapp/views/guards_screens/main_board.dart';
import 'package:tukiapp/views/guards_screens/tennis_detail.dart';
import 'package:tukiapp/views/guards_screens/validate_person.dart';
import 'package:tukiapp/views/guards_screens/validate_person_details.dart';
import 'package:tukiapp/views/guards_screens/working_guest.dart';
import 'package:tukiapp/views/guest_final/checkout.dart';
import 'package:tukiapp/views/guest_final/editprofile.dart';
import 'package:tukiapp/views/guest_final/guest_dashboard.dart';
import 'package:tukiapp/views/guest_final/login_guest.dart';
import 'package:tukiapp/views/guest_final/rules.dart';
import 'package:tukiapp/views/guest_final/setting_guard.dart';
import 'package:tukiapp/views/guest_final/ticket_details.dart';
import 'package:tukiapp/views/guest_final/your_invitation.dart';
import 'package:tukiapp/views/owner_screens/co_owner.dart';
import 'package:tukiapp/views/owner_screens/create_coowners.dart';
import 'package:tukiapp/views/owner_screens/elimination.dart';
import 'package:tukiapp/views/owner_screens/guest_list.dart';
import 'package:tukiapp/views/owner_screens/log.dart';
import 'package:tukiapp/views/owner_screens/my_bookings.dart';
import 'package:tukiapp/views/owner_screens/neslon_dash.dart';
import 'package:tukiapp/views/owner_screens/owner_check.dart';
import 'package:tukiapp/views/owner_screens/owner_profile.dart';
import 'package:tukiapp/views/owner_screens/owners.dart';
import 'splash_page.dart';

import 'controllers/admin_controller.dart';
import 'controllers/auth_controller.dart';
import 'controllers/general_controller.dart';
import 'views/admin_screens/admin_dashboard.dart';
import 'views/admin_screens/guard_listing.dart';
import 'views/admin_screens/quick_contact.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        initialBinding: InitialBinding(),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Tuki App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AdminDashboard(
            // eventData: null,
            ),
      );
    });
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(GeneralController());
    Get.put(AuthController());
    Get.put(AdminController());
    // Get.put(NotificationController());
    // Get.put(PricingController());
    // Get.put(ShiftController());
  }
}
