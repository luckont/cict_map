import 'package:flutter/material.dart';
import 'dart:ui';
import '../constants/data.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

class ImageOnCanvas extends StatelessWidget {
  const ImageOnCanvas({Key? key}) : super(key: key);
  static const routeName = '/paint_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Chi tiết đường đi'),
      ),
      body: FutureBuilder<ui.Image>(
        future: _loadImage("assets/images/CICT_tret1.jpg"),
        builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Image loading...');
            default:
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Center(
                  child: CustomPaint(
                    painter: ImagePainter(snapshot.data!),
                    child: const SizedBox(
                      width: 300,
                      height: 300,
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

Future<ui.Image> _loadImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);
  final codec = await ui.instantiateImageCodec(
    data.buffer.asUint8List(),
    targetHeight: 393,
    targetWidth: 300,
    // allowUpscaling: true,
  );
  var frame = await codec.getNextFrame();
  return frame.image;
}

class ImagePainter extends CustomPainter {
  final ui.Image image;

  ImagePainter(this.image);

  @override
  //Ham vach duong
  void paint(Canvas canvas, Size size) {
    //Xac dinh diem dau va diem dich
    final first = Location(name: 'Phong 101', x: 150, y: 250);
    final second = Location(name: 'Phong 109', x: 192, y: -100);

    //Dinh nghia tham so duong ve
    var myPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //Dinh nghia tham so diem danh dau
    var myPoint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 15
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    //Ham vach duong
    final Path path = Path()
      ..moveTo(first.x, first.y)
      ..lineTo(192, 250)
      ..lineTo(second.x, second.y);

    //Ham goi ban do
    canvas.drawImage(image, Offset(-46, -240), myPaint);

    //Ham goi duog ve
    canvas.drawPath(path, myPaint);

    //Ham goi diem danh dau
    canvas.drawPoints(PointMode.points,
        [Offset(first.x, first.y), Offset(second.x, second.y)], myPoint);
  }

  @override
  bool shouldRepaint(ImagePainter oldDelegate) {
    return false;
  }
}
