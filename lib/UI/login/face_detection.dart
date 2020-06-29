import 'dart:async';
import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterhackathon/UI/main_screen/main_scree.dart';
import 'package:flutterhackathon/widgets/customs/custom_rect.dart';

import 'package:flutterhackathon/widgets/scanner_animation.dart';
import 'package:tflite/tflite.dart';

List<CameraDescription> cameras; // to check cameras

class LoginFaceDetection extends StatefulWidget {
  @override
  _LoginFaceDetectionState createState() => _LoginFaceDetectionState();
}

class _LoginFaceDetectionState extends State<LoginFaceDetection>
    with WidgetsBindingObserver, TickerProviderStateMixin<LoginFaceDetection> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CameraController controller;
  static StreamController<Map<dynamic, dynamic>> imageStream =
      StreamController.broadcast();

  bool _isDetecting = false;

  AnimationController _animationController;
  bool _animationStopped = false;
  String scanText = "Start";
  bool scanning = true;

  @override
  void initState() {
    loadModelML();
    getCameras();
    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animateScanAnimation(true);
      } else if (status == AnimationStatus.dismissed) {
        animateScanAnimation(false);
      }
    });
    animateScanAnimation(false);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    Tflite.close();
    controller?.dispose();
    imageStream?.close();
    super.dispose();
  }

  void animateScanAnimation(bool reverse) {
    if (reverse) {
      _animationController.reverse(from: 1.0);
    } else {
      _animationController.forward(from: 0.0);
    }
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
    cameras = await availableCameras();
    controller = CameraController(cameras[1], ResolutionPreset.high);
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
      log("${results[0]}");
      if (results[0]['label'] == 'person') {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      }
    }
    _isDetecting = false;
  }

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

  // method to generate exception depends on error
  void _showCameraException(CameraException e) {
    print(e.code + e.description);
    showInSnackBar('Error: ${e.code}\n${e.description}');
  }

  void showInSnackBar(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 1),
        content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _cameraPreviewWidget(),
          ImageScannerAnimation(
            _animationStopped,
            MediaQuery.of(context).size.width,
            animation: _animationController,
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: CustomPaint(
                painter: MyPainter(false),
              ),
            ),
          ),
        ],
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
}
