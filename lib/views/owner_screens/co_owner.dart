import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:tukiapp/generated/assets.dart';
import 'package:tukiapp/views/guards_screens/guard_report.dart';
import 'package:tukiapp/widgets/custom_textfield.dart';
import 'package:tukiapp/widgets/custom_widget.dart';

class CreateCoOwner extends StatefulWidget {
  const CreateCoOwner({Key? key}) : super(key: key);

  @override
  _CreateCoOwnerState createState() => _CreateCoOwnerState();
}

class _CreateCoOwnerState extends State<CreateCoOwner> {
  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  List<String> coOwners = []; // List to store co-owners

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _addCoOwner() {
    String newOwner = _idController.text + " - " + _nameController.text;
    setState(() {
      coOwners.add(newOwner);
    });
    _idController.clear();
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text('Co Owners'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Co Owners List",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: coOwners.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(coOwners[index]),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              controller: _idController,
              hintText: 'ID',
            ),
            SizedBox(height: 8),
            CustomTextField(
              controller: _nameController,
              hintText: 'Name',
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _addCoOwner,
                child: Text("Add Co Owner"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
