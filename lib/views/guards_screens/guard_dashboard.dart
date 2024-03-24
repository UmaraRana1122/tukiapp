import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:sizer/sizer.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

import 'qr_screen.dart';
import 'upcoming_event.dart';
import 'validate_person.dart';
import '../../widgets/custom_textfield.dart';
import '../../constants/custom_navigation.dart';
import '../../constants/custom_validators.dart';
import '../../constants/global_variables.dart';

class GuardDashboard extends StatefulWidget {
  const GuardDashboard({Key? key}) : super(key: key);

  @override
  State<GuardDashboard> createState() => _GuardDashboardState();
}

class _GuardDashboardState extends State<GuardDashboard> {
  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  Widget build(BuildContext context) {
   

    return FutureBuilder<bool>(
      future: checkAuthorization(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data == true) {
          return _buildAuthorizedScreen();
        } else {
          return Scaffold(
            body: Center(
              child: Text('You are not authorized to access this page.'),
            ),
          );
        }
      },
    );
  }

  Widget _buildAuthorizedScreen() {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Guard Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.yellow[900],
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildDashboardItems(),
              SizedBox(height: 3.h),
              _buildAddNotesSection(),
              SizedBox(height: 3.h),
              _buildScanQRButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assest/images/NA.png", height: 7.h),
                Text(
                  "Nelson Aston",
                  style: bodyNormal.copyWith(fontSize: 18),
                ),
                Text(
                  "nelsonaston@gmail.com",
                  style: bodyNormal.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          _buildDrawerItem(
            title: "My Profile",
            icon: "assest/images/11.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "Notifications",
            icon: "assest/images/12.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "Guard Report",
            icon: "assest/images/12.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "Settings",
            icon: "assest/images/13.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "About Community Rules",
            icon: "assest/images/14.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "Share App",
            icon: "assest/images/15.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "Rate App",
            icon: "assest/images/17.png",
            onTap: () {},
          ),
          _buildDrawerItem(
            title: "Logout",
            icon: "assest/images/16.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required String title,
    required String icon,
    required void Function() onTap,
  }) {
    return ListTile(
      leading: Image.asset(icon, height: 4.5.h),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildDashboardItems() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDashboardItem(
            label: "Upcoming Events",
            value: "38",
            onTap: () => PageTransition.pageNavigation(page: UpcomingEvent()),
          ),
          _buildDashboardItem(
            label: "Validate Persons",
            value: "05",
            onTap: () => PageTransition.pageNavigation(page: ValidatePerson()),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardItem({
    required String label,
    required String value,
    required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 6.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: const Color(0xff57009b26),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 3.h,
              height: 10.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Center(child: Text(value)),
            ),
            Container(
              child: Center(child: Text(label, style: bodySmall)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildAddNotesSection() {
    return Container(
      height: 53.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Publish With",
              style: bodyNormal.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomDropdown(
              options: const [
                "Black",
                "Brown",
                "Purple",
                "Blue",
                "Green/Black",
                "Green",
              ],
              hint: '     Validate People',
              onChanged: (String) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: CustomTextField(
              validator: (value) => CustomValidator.email(value),
              hintText: "Subject",
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Container(
              height: 20.h,
              width: 85.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: SingleChildScrollView(
                child: TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  textInputAction: TextInputAction.none,
                  maxLines: null,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(100),
                  ],
                  cursorColor: AppColors.primaryColor,
                  style: const TextStyle(fontSize: 17),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    border: InputBorder.none,
                    hintText: "Enter complete message here",
                    hintStyle: bodyNormal.copyWith(color: Colors.black54),
                    prefixIconColor: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: CustomButton(
              buttonText: "Submit",
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScanQRButton() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          PageTransition.pageNavigation(page: QRScreen());
        },
        child: Container(
          height: 5.h,
          width: 90.w,
          decoration: BoxDecoration(
            color: const Color(0xffBCD0F3),
            border: Border.all(
              color: const Color(0xffBCD0F3),
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assest/images/qrIcon.png",
                    height: 3.h,
                  ),
                  SizedBox(width: 3.w),
                  Text(
                    'Scan QR',
                    style: bodyNormal,
                  ),
                  const Icon(Icons.navigate_next_outlined),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> checkAuthorization() async {
    var headers = {
      'Authorization':
          'Bearer {{token}}',
      'Cookie':
'auth_session=X612Hl70yVBXT3HpyNHycG9GuMqCPR3U%2FSg80fGwsa3H5VS46I4fF64gURxnvtlIkYSQ9AcGdG1kjIP6lVDV%2Bg%2BrKxz3f%2FIGrj6HrdGiMBPzDGpy42IDL0oxzDZyvTeitVtKwTcP1DoeoiHyroTtXmCuqPMeSD4cdHiJoK03NWGz%2F3%2B38F33OSWp%2BV3PmonUkufSCcOg%2FYFY2XZ9q9eah0pyUz7Q6YbkmcYHYseHCgVw%2F2h4C2tM8lCTTmtOSgCjZaO2VlRMsTYsgUHVOqF5A9S7ETY69uzO5VgGVFCbAP9%2F8FQCFpp88f3qv%2F8nryhf5SSsCCRdTQ5%2BY%2FA7rmQNaGLgIF%2F72RjombhGB8up5C4%3D--jAYHdYBiIFYP2sEr--QOsfRqGXcHd0%2FPTqvCYPug%3D%3D',    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://tuki-api-0398bb6381b8.herokuapp.com/api/v1/guard/dashboard'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      // Authorized
      return true;
    } else {
      // Not Authorized
      print('Response Body: ${await response.stream.bytesToString()}');
      return false;
    }
  }

}
