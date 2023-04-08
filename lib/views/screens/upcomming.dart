import 'dart:io';
import 'package:business_app/helper/helps.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constant.dart';
import 'package:get/get.dart';
import '../../main.dart';

class ScreenBusinessUpcomming extends StatefulWidget {
  @override
  State<ScreenBusinessUpcomming> createState() =>
      _ScreenBusinessUpcommingState();
}

class _ScreenBusinessUpcommingState extends State<ScreenBusinessUpcomming> {
  final TextEditingController priceController = TextEditingController();

  final TextEditingController roomController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  CollectionReference products = FirebaseFirestore.instance.collection('upcoming');

  void addData() async {
    final imageUrl = await uploadImage(_img);
    await products.doc().set({
      'name': nameController.text.trim(),
      'price': priceController.text.trim(),
      'room': roomController.text.trim(),
      'desc': descController.text.trim(),
      'images': imageUrl,
      // 'uid': FirebaseAuth.instance.currentUser.uid,
    }).whenComplete(() {
      Get.snackbar('Successfully', 'Data Added');
    });
  }

  bool loading = false;

  File _img;

  final picker = ImagePicker();
  //String downloadUrl;
  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _img = File(pick.path);
        } else {
          displayMessage("No Image Selected");
        }
      });
    } catch (e) {
      displayMessage(e.toString());
    }
  }

  Future uploadImage(File _img) async {
    String url;
    String imageId = DateTime.now().microsecondsSinceEpoch.toString();
    Reference refrance = await FirebaseStorage.instance
        .ref()
        .child('images')
        .child('user$imageId');
    await refrance.putFile(_img);
    url = await refrance.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Add New Hostel",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: loading ? Center(child: CircularProgressIndicator(color: colors,),):Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: Card(
                    elevation: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: _img == null
                                ? Text(
                              "Select Image",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            )
                                : Image.file(
                              _img,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            imagePicker();
                          },
                          child: Text(
                            "Select Image",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextInputField(
                    controller: nameController,
                    labelText: 'Name',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextInputField(
                    controller: priceController,
                    labelText: 'Price',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextInputField(
                    controller: roomController,
                    labelText: 'Available room',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 4,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: TextInputField(

                    controller: descController,
                    labelText: 'Description',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              loading
                  ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
                  : Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.65,
                  height: MediaQuery.of(context).size.height * 0.065,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        loading = true;
                      });
                      addData();
                      setState(
                            () {
                          loading = false;
                        },
                      );
                    },
                    child: const Center(
                      child: Text(
                        'post',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
