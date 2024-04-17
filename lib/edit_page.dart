import 'dart:typed_data';
import 'dart:ui';
import 'dart:math' as math;
import 'package:festival_ui/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Editpage extends StatefulWidget {
  const Editpage({super.key});

  @override
  State<Editpage> createState() => _EditpageState();
}

class _EditpageState extends State<Editpage> {
  Map? data;
  bool isValid = true;

  String? namefont,
      companyfont,
      mobilenofont,
      emailfont,
      websitefont,
      companyaddressfont;

  double val = 0;
  double rotationAngle = 0;
  double zoomLevel = 1.0;
  double? x;
  double? y;


  void initState() {
    super.initState();
  }

  GlobalKey<FormState> fKey = GlobalKey<FormState>();
  GlobalKey key = GlobalKey();

  TextEditingController nameController =
      TextEditingController(text: InfoData.name);
  TextEditingController emailController =
      TextEditingController(text: InfoData.email);
  TextEditingController companyController =
      TextEditingController(text: InfoData.companyname);
  TextEditingController mobileController =
      TextEditingController(text: InfoData.mobileNo);
  TextEditingController companyaddressController =
      TextEditingController(text: InfoData.companyaddress);
  TextEditingController companywebsiteController =
      TextEditingController(text: InfoData.website);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    data = ModalRoute.of(context)?.settings.arguments as Map?;
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool confirmExit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Confirm Exit"),
              content:
                  Text("Are you sure you want to discard changes and exit?"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    "No",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          },
        );
        return confirmExit ?? false;
      },
      child: Scaffold(
          backgroundColor: Color(0xffF3F3F3),
          appBar: AppBar(
            backgroundColor: Color(0xff30BA9D),
            leading: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Confirm Deletion"),
                      content:
                          Text("Are you sure you want to delete this post?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "No",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Yes",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.white,
              ),
            ),
            title: Text(
              "Edit POST",
              style: TextStyle(
                color: Color(0xffF3DC6E),
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () async {
                  RenderRepaintBoundary rrb = key.currentContext
                      ?.findRenderObject() as RenderRepaintBoundary;
                  var image = await rrb.toImage();
                  var pngImg =
                      await image.toByteData(format: ImageByteFormat.png);
                  Uint8List? asUint8List = pngImg?.buffer.asUint8List();

                  savedImg = asUint8List;
                  Navigator.pushNamed(context, "SaveImage");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.save_alt,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Stack(
                    children: [
                      RepaintBoundary(
                        key: key,
                        child: Container(
                          height: 400,
                          width: 400,
                          child: Stack(
                            children: [
                              Transform.scale(
                                scale: zoomLevel,
                                child: Image.network(
                                  data?["img"] ?? "",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 330,
                                child: Container(
                                  height: 60,
                                  width: 400,
                                  color: Colors.black38,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              InfoData.email ?? "",
                                              style: TextStyle(
                                                fontSize: val,
                                                color: Colors.white,
                                                fontFamily: emailfont,
                                              ),
                                            ),
                                            Text(
                                              InfoData.mobileNo ?? "",
                                              style: TextStyle(
                                                fontSize: val,
                                                color: Colors.white,
                                                fontFamily: mobilenofont,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            InfoData.companyaddress ?? "",
                                            style: TextStyle(
                                              fontSize: val,
                                              color: Colors.white,
                                              fontFamily: companyaddressfont,
                                            ),
                                          ),
                                          Text(
                                            InfoData.website ?? "",
                                            style: TextStyle(
                                              fontSize: val,
                                              color: Colors.white,
                                              fontFamily: websitefont,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Positioned(
                            left: (x ?? -1) * (MediaQuery.of(context).size.width / 2),
                            top: (y ?? 0) * (MediaQuery.of(context).size.height / 2),
                            child: Text(
                              InfoData.companyname ?? "",
                              style: TextStyle(
                                fontSize: val,
                                fontFamily: companyfont,
                              ),
                            ),
                          ),
                          SizedBox(width: 270),
                          Transform.rotate(
                            angle: rotationAngle * math.pi / 180,
                            child: Text(
                              InfoData.name ?? "",
                              style: TextStyle(fontSize: val, fontFamily: namefont),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        scrollControlDisabledMaxHeightRatio: double.infinity,
                        builder: (BuildContext mContext) {
                          return Container(
                            width: double.infinity,
                            child: Form(
                              key: fKey,
                              child: Column(children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          nameController.clear();
                                          emailController.clear();
                                          companyController.clear();
                                          mobileController.clear();
                                          companyaddressController.clear();
                                          companywebsiteController.clear();
                                        },
                                        child: Text(
                                          "Clear",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "User Detail",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                          setState(() {});
                                        },
                                        child: Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child:
                                      Divider(color: Colors.grey, thickness: 2),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    controller: nameController,
                                    decoration: InputDecoration(
                                      label: Text("Name"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      label: Text("Email"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    controller: companyController,
                                    decoration: InputDecoration(
                                      label: Text("Company Name"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    controller: mobileController,
                                    decoration: InputDecoration(
                                      label: Text("Mobile Number"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    controller: companyaddressController,
                                    decoration: InputDecoration(
                                      label: Text(" Company Address"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: TextFormField(
                                    controller: companywebsiteController,
                                    decoration: InputDecoration(
                                      label: Text(" Company Website"),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: InkWell(
                                    onTap: () {
                                      bool isValid =
                                          fKey.currentState?.validate() ??
                                              false;

                                      if (isValid) {
                                        InfoData.name = nameController.text;
                                        InfoData.email = emailController.text;
                                        InfoData.companyname =
                                            companyController.text;
                                        InfoData.mobileNo =
                                            mobileController.text;
                                        InfoData.companyaddress =
                                            companyaddressController.text;
                                        InfoData.website =
                                            companywebsiteController.text;
                                        fKey.currentState?.save();
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      height: 70,
                                      width: 310,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: Color(0xffAEC3A4),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Save",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ]),
                            ),
                          );
                        });
                  },
                  child: Center(
                    child: Container(
                      height: 70,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xffAEC3A4),
                      ),
                      child: Center(
                          child: Text(
                        "Add Edit Post User Name",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: fontStyle.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            onPressed: () {
                              namefont = e;
                              companyfont = e;
                              emailfont = e;
                              mobilenofont = e;
                              companyaddressfont = e;
                              websitefont = e;
                              setState(() {});
                            },
                            child: Text(e, style: TextStyle(fontFamily: e)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Font Size",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Slider(
                  value: val,
                  max: 100,
                  onChanged: (value) {
                    setState(() {
                      val = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Font Rotat",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Slider(
                  value: rotationAngle,
                  min: 0,
                  max: 360,
                  onChanged: (value) {
                    setState(() {
                      rotationAngle = value;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "Zoom image in and out",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                Slider(
                  value: zoomLevel,
                  min: 1.0,
                  max: 5.0,
                  onChanged: (newValue) {
                    setState(() {
                      zoomLevel = newValue;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "left to right",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                ),
                Slider(
                  min: -1,
                  max: 1,
                  value: x ?? -1,
                  onChanged: (value) {
                    x = value;
                    setState(() {});
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    "top and bottom",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
                  ),
                ),
                Slider(
                  min: -1,
                  max: 1,
                  value: y ?? 0,
                  onChanged: (value) {
                    y = value;
                    setState(() {});
                  },
                ),
              ],
            ),
          )),
    );
  }
}
