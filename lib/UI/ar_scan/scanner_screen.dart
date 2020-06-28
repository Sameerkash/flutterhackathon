import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutterhackathon/widgets/bounce_button.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';
import 'package:flutterhackathon/widgets/customs/detected_rect.dart';
import 'dart:async';
import 'package:tflite/tflite.dart';

List<CameraDescription> cameras; // to check cameras

class CameraScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin<CameraScreen> {
  CameraController controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  static StreamController<Map<dynamic, dynamic>> imageStream =
      StreamController.broadcast();

  bool _isDetecting = false;

  @override
  void initState() {
    getCameras();
    super.initState();
  }

  @override
  void dispose() {
    Tflite.close();
    controller?.dispose();
    imageStream?.close();

    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      if (controller != null) {
        onNewCameraSelected(controller.description);
      }
    }
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    controller = CameraController(cameraDescription, ResolutionPreset.high);
    controller.addListener(() {
      if (mounted) setState(() {});
      if (controller.value.hasError) {
        showInSnackBar('Error camera ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future getCameras() async {
    loadModelML();
    cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) async {
      if (!mounted) {
        return;
      }
      if (this.mounted) setState(() {});
      await controller
          .startImageStream((CameraImage image) => _processCameraImage(image));
    });
  }

  void _processCameraImage(CameraImage image) async {
    if (_isDetecting) return;
    _isDetecting = true;
    Future findDogFuture = classifyImageCamera(image);

    List results = await Future.wait(
        [findDogFuture, Future.delayed(Duration(milliseconds: 500))]);
    if (results.isNotEmpty) {
      // _outputs?.clear();
      imageStream.sink.add(results[0]);
    }
    _isDetecting = false;
  }

  // method to generate exception depends on error
  void _showCameraException(CameraException e) {
    print(e.code + e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  // by default permission is = false
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Stack(
            fit: StackFit.expand,
            children: <Widget>[
              _cameraPreviewWidget(),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: Color.fromRGBO(197, 1, 80, 1)),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Color.fromRGBO(28, 28, 137, 1).withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.transparent)),
              Positioned(
                top: 36,
                left: MediaQuery.of(context).size.width * 0.3,
                right: MediaQuery.of(context).size.width * 0.3,
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Color.fromRGBO(197, 1, 80, 1)),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: Colors.black38),
                    child: Center(
                      child: Text(
                        "SCAN",
                        style:
                            TextStyle(fontSize: 22, color: Colors.green[300]),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: CustomPaint(
                    painter: MyPainter(true),
                  ),
                ),
              ),
              StreamBuilder(
                  stream: imageStream.stream,
                  builder: (context, snappShot) {
                    if (!snappShot.hasData)
                      return Center(
                        child: Text(
                          "Object detecting...",
                          style: TextStyle(
                              color: Colors.greenAccent, fontSize: 18),
                        ),
                      );
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: CustomPaint(
                          painter: CameraPainter(
                        snappShot.data,
                      )),
                    );
                  }),
            ],
          ),
          Positioned(
              top: 37,
              right: 40,
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Color.fromRGBO(197, 1, 80, 1)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(28, 28, 137, 1).withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.black38),
                child: BounceButton(
                    iconImagePath: SvgPicture.asset(
                      'assets/images/menu.svg',
                      width: 40,
                      color: Colors.purpleAccent,
                    ),
                    onPressed: () {
                      controller.dispose();
                      imageStream.close();
                      Navigator.pop(context);
                    }),
              )),
        ],
      ),
    );
  }

  Widget getOptionsWidget() {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.purpleAccent),
        actionsIconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back_ios, size: 30)),
        actions: <Widget>[_getCameraSwitch()],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

    if (controller == null || !controller.value.isInitialized) {
      return Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          backgroundColor: Colors.purple,
        ),
      );
    } else {
      return Center(
        child: Transform.scale(
          scale: controller.value.aspectRatio / deviceRatio,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
          ),
        ),
      );
    }
  }

  //button to switch between cameras
  Widget _getCameraSwitch() {
    return SizedBox(
      height: 60,
      width: 60,
      child: InkWell(
        onTap: () {
          if (controller != null && !controller.value.isRecordingVideo) {
            CameraLensDirection direction =
                controller.description.lensDirection;
            CameraLensDirection required =
                direction == CameraLensDirection.front
                    ? CameraLensDirection.back
                    : CameraLensDirection.front;

            for (CameraDescription cameraDescription in cameras) {
              if (cameraDescription.lensDirection == required) {
                onNewCameraSelected(cameraDescription);
                return;
              }
            }
          }
        },
        borderRadius: BorderRadius.circular(20.0),
        splashColor: Colors.purpleAccent,
        child: Padding(
            padding: const EdgeInsets.all(10.0), child: Icon(Icons.ac_unit)),
      ),
    );
  }

  // the row located camera button, swich button and etc.

  Future<Map> classifyImageCamera(CameraImage image) async {
    List resultList = await Tflite.detectObjectOnFrame(
        bytesList: image.planes.map((plane) {
          return plane.bytes;
        }).toList(),
        model: "SSDMobileNet",
        imageHeight: image.height,
        imageWidth: image.width,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.2,
        numResultsPerClass: 2, // defaults to 5
        asynch: true);
    print("+++++++++++++++++++++++++++ $resultList");

    Map biggestRect = {};
    double rectSize, rectMax = 0.0;
    for (int i = 0; i < resultList.length; i++) {
      // if (possibleDog.contains(resultList[i]["detectedClass"])) {
      Map aRect = resultList[i]["rect"];
      rectSize = aRect["w"] * aRect["h"];
      Map label = {"label": resultList[i]["detectedClass"]};

      if (rectSize > rectMax) {
        rectMax = rectSize;
        biggestRect.addAll(aRect);
        biggestRect.addAll(label);
      }
    }
    return biggestRect;
  }

  Future loadModelML() async {
    return await Tflite.loadModel(
        model: "assets/tflite/ssd_mobilenet.tflite",
        labels: "assets/tflite/ssd_mobilenet.txt");
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 1),
        content: Text(message)));
  }
}
