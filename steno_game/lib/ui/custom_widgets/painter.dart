import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import '../../model/drawing_point.dart';
import '../constants/game_color.dart';

class Painter extends StatefulWidget {

  const Painter({Key? key, required this.globalKey}) : super(key: key);

  final GlobalKey globalKey;

  @override
  State<Painter> createState() => _PainterState();
}

class _PainterState extends State<Painter> {
  var historyDrawingPoints = <DrawingPoint>[];
  var drawingPoints = <DrawingPoint>[];

  double imageSize = 350;

  DrawingPoint? currentDrawingPoint;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: GameColor.secondaryColor,
          width: 3,
          style: BorderStyle.solid,
        ),
      ),
      child: Container(
        width: imageSize,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      if (drawingPoints.isNotEmpty &&
                          historyDrawingPoints.isNotEmpty) {
                        setState(() {
                          drawingPoints.removeLast();
                        });
                      }
                    },
                    icon: const Icon(
                      Icons.undo_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (drawingPoints.length <
                            historyDrawingPoints.length) {
                          final index = drawingPoints.length;
                          drawingPoints.add(historyDrawingPoints[index]);
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.redo_rounded,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: imageSize,
              child: RepaintBoundary(
                key: widget.globalKey,
                child: CustomPaint(
                  painter: DrawingPainter(
                    drawingPoints: drawingPoints,
                    imageSize: imageSize,
                  ),
                  child: GestureDetector(
                    onPanStart: (details) {
                      setState(() {
                        currentDrawingPoint = DrawingPoint(
                          id: DateTime.now().microsecondsSinceEpoch,
                          offsets: [
                            details.localPosition,
                          ],
                        );

                        if (currentDrawingPoint == null) return;
                        drawingPoints.add(currentDrawingPoint!);
                        historyDrawingPoints = List.of(drawingPoints);
                      });
                    },
                    onPanUpdate: (details) {
                      setState(() {
                        if (currentDrawingPoint == null) return;
                        currentDrawingPoint = currentDrawingPoint?.copyWith(
                          currentDrawingPoint!.offsets
                            ..add(details.localPosition),
                        );

                        drawingPoints.last = currentDrawingPoint!;
                        historyDrawingPoints = List.of(drawingPoints);
                      });
                    },

                    onPanEnd: (_) {
                      currentDrawingPoint = null;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class DrawingPainter extends CustomPainter {
  final List<DrawingPoint> drawingPoints;
  final double imageSize;

  DrawingPainter({required this.drawingPoints, required this.imageSize});

  @override
  void paint(Canvas canvas, Size size) {

    final whitePaint = Paint()..color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), whitePaint);

    for (var drawingPoint in drawingPoints) {

      final paint = Paint()
        ..color = drawingPoint.color
        ..isAntiAlias = true
        ..strokeWidth = drawingPoint.width
        ..strokeCap = StrokeCap.round;

      for (var i = 0; i < drawingPoint.offsets.length; i++) {
        print("haha");
        final currentOffset = drawingPoint.offsets[i];
        if (!(drawingPoint.offsets[i] > const Offset(2, 2) &&
            drawingPoint.offsets[i] <
                Offset(imageSize - 2, imageSize - 2))) continue;
        var notLastOffset = i != drawingPoint.offsets.length - 1;
        if (notLastOffset) {
          final next = drawingPoint.offsets[i + 1];
          canvas.drawLine(currentOffset, next, paint);
        } else {
          canvas.drawCircle(currentOffset, drawingPoint.width/2, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
