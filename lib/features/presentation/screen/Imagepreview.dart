import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/core/App/AppConstatnt.dart';
class ImagePreview extends StatefulWidget {
   ImagePreview({super.key,required this.path,required this.width,required this.height});
String path;
 num height,width;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Image.network(
               AppConstant.baseImage+widget.path,
                height: double.parse(widget.height.toString()),
                width: double.parse(widget.width.toString()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
