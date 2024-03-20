// import 'package:flutter/material.dart';
// import 'package:flutter_switch/flutter_switch.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';
// import 'package:tukiapp/views/admin_screens/widgets/labeled_textfield.dart';

// class NewCard extends StatefulWidget {
//   const NewCard({Key? key}) : super(key: key);

//   @override
//   State<NewCard> createState() => _NewCardState();
// }

// class _NewCardState extends State<NewCard> {
//   bool isUserAuthorized = false;

//   Widget _buildSection(
//     String title,
//     List<String> fields,
//     List<String> hintList,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           for (int i = 0; i < fields.length; i++)
//             LabeledTextField(
//               heading: fields[i],
//               hintText: hintList.length > i ? hintList[i] : '', readOnly: false,
//             ),
//         ],
//       ),
//     );
//   }

//   void _showPaymentSuccessDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Payment Successful"),
//         content: Text("Your payment has been successfully processed."),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios_new_outlined),
//           onPressed: () {
//             Get.back();
//           },
//         ),
//         title: const Text('Add Payment Card'),
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(14.0),
//           child: Column(
//             children: [
//               Text(
//                 "Card Detail",
//                 style: TextStyle(fontWeight: FontWeight.w600),
//               ),
//               _buildSection(
//                 "Personal Details",
//                 [
//                   "Name on card",
//                   "Card No",
//                   "Expiration Date",
//                   "Security Code",
//                 ],
//                 [
//                   "Elbo2",
//                   "2345 4567 4567 5467",
//                   "12/23",
//                   "******",
//                 ],
//               ),
//               Row(
//                 children: [
//                   Text(
//                     "Save Card Details",
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                   Spacer(),
//                   FlutterSwitch(
//                     height: 29,
//                     width: 58.0,
//                     toggleSize: 35.0,
//                     value: isUserAuthorized,
//                     borderRadius: 20.0,
//                     padding: 2,
//                     activeToggleColor: Color(0xff00A3FF),
//                     inactiveToggleColor: Colors.transparent,
//                     activeSwitchBorder: Border.all(
//                       color: Color(0xff00A3FF),
//                       width: 2.0,
//                     ),
//                     inactiveSwitchBorder: Border.all(
//                       color: Colors.white,
//                       width: 2.0,
//                     ),
//                     activeColor: Color(0xffFFFFff),
//                     inactiveColor: Colors.grey,
//                     activeIcon: CircleAvatar(
//                       backgroundColor: Color(0xff00A3FF),
//                     ),
//                     inactiveIcon: CircleAvatar(
//                       backgroundColor: Colors.white,
//                     ),
//                     onToggle: (val) {
//                       setState(() {
//                         isUserAuthorized = val;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 30.h,
//               ),
//               InkWell(
//                 onTap: () {
//                   _showPaymentSuccessDialog();
//                 },
//                 child: Container(
//                   height: 5.h,
//                   width: 100.w,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.grey),
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Align(
//                     child: Text(
//                       "Confirm",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
