import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

// This implementation here is important for launch request permission when the App launches.
Permission permissionFromString(String value){
  Permission permission;
  for (var item in Permission.values) {
    if(item.toString() == value) {
      permission = item;
      break;
    }
  }
  return permission;
}


void main() async {

  cameras = await availableCameras();
  await SimplePermissions.requestPermission(permissionFromString(Permission.WriteExternalStorage.toString()));
  await SimplePermissions.requestPermission(permissionFromString(Permission.Camera.toString()));

  runApp(
      new MaterialApp(
          home: MyApp()
      )
  );
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {

  CameraController cameraController;
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  Permission _permissionsCamera;
  Permission _permissionsStorage;

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((_) {
      if(!mounted) return;
      setState(() {
        // TODO Anything you want here!

      });
    });

    _permissionsCamera = permissionFromString(Permission.Camera.toString());
    _permissionsStorage = permissionFromString(Permission.WriteExternalStorage.toString());
  }

  void takePicture() async {
    PermissionStatus hasCamera = await SimplePermissions.requestPermission(_permissionsCamera);
    PermissionStatus hasStorage = await SimplePermissions.requestPermission(_permissionsStorage);

    if(hasStorage != PermissionStatus.authorized || hasCamera != PermissionStatus.authorized) {
      showSnackBar("Lacking permissions to take a picture");
      return;
    }

    _saveImage().then((String filePath) {
        if(mounted && filePath != null) showSnackBar("Picture saved to $filePath");
    });

  }


  Future<String> _saveImage() async {
    String timeStamp = DateTime.now().millisecondsSinceEpoch.toString();
    String filePath = '/storage/emulated/0/Pictures/Flutter_App_$timeStamp.jpg';

    if(cameraController.value.isTakingPicture) return null;

    try {
      await cameraController.takePicture(filePath);
    } on CameraException catch (e) {
      showSnackBar(e.toString());
    }
    return filePath;
  }

  void showSnackBar(String message) {
    _scaffoldState.currentState.showSnackBar(SnackBar(content: Text(message),));
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        title: Text("Screen Name"),
      ),
      body: Container(
        padding: EdgeInsets.all(0.0),
        child: Center(
          child: Column(
            children: <Widget>[

              Text("Let's take a picture!",
                  style: TextStyle(
                      fontSize: 32,
                      shadows: [Shadow(offset: Offset(2, 1), color: Colors.black26,
                      blurRadius: 5)]),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(onPressed: takePicture , child: Text("TAKE A PICTURE")),
                  RaisedButton(onPressed: () => SimplePermissions.openSettings() , child: Text("Settings")),
                ],
              ),

              AspectRatio(
                aspectRatio: 1.0,
                child: CameraPreview(cameraController),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
