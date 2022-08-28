import 'dart:async';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class GyroRotatedCard extends StatefulWidget {
  const GyroRotatedCard({
    Key? key,
    required this.child,
    this.sensitivity = 7,
    this.blurVolume = 7,
  }) : super(key: key);

  final Widget child;
  final int sensitivity;
  final double blurVolume;

  @override
  State<GyroRotatedCard> createState() => _GyroRotatedCardState();
}

class _GyroRotatedCardState extends State<GyroRotatedCard> {
  late final StreamSubscription<AccelerometerEvent> _stream;

  final ValueNotifier<Offset> _offset = ValueNotifier(const Offset(0, 0));

  @override
  void initState() {
    super.initState();
    _stream = accelerometerEvents.listen((event) {
      SendPort()
      var offsetX = event.x * widget.sensitivity;
      var offsetY = event.y * (widget.sensitivity / 2);

      var dx = (offsetX.abs() - _offset.value.dx.abs()).abs();
      var dy = (offsetY.abs() - _offset.value.dy.abs()).abs();
      if (dx > 0.5) {
        if (dx > 5) {
          offsetX = offsetX / 5 * 3;
        }
        _offset.value = Offset(offsetX, _offset.value.dy);
      }
      if (dy > 0.5) {
        if (dy > 5) {
          offsetY = offsetY / 5 * 3;
        }
        _offset.value = Offset(_offset.value.dx, offsetY);
      }
    });
  }

  @override
  void dispose() {
    _stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _offset,
      builder: (BuildContext context, Offset value, Widget? _) {
        return ClipRRect(
          child: Stack(
            children: [
              Center(
                child: Transform(
                  transform: Matrix4.translationValues(-value.dx, value.dy, 0),
                  child: widget.child,
                ),
              ),
              Center(
                child: Transform(
                  transform: Matrix4.translationValues(value.dx, -value.dy, 0),
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                        sigmaX: widget.blurVolume, sigmaY: widget.blurVolume),
                    child: widget.child,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
