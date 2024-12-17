// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:schools_map/config/core/exports.dart';

class LoadedDrawerBtn extends StatefulWidget {
  final Function()? onLongTap;
  const LoadedDrawerBtn({
    Key? key,
    this.onLongTap,
  }) : super(key: key);

  @override
  State<LoadedDrawerBtn> createState() => _LoadedDrawerBtnState();
}

class _LoadedDrawerBtnState extends State<LoadedDrawerBtn> {
  double _progressValue = 0.0;
  late Timer timer;
  @override
  void initState() {
    super.initState();
  }

  void _timerEnd() {
    timer.cancel();
    setState(() {
      _progressValue = 0;
    });
  }

  void _startProgress() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (_) {
      setState(() {
        _progressValue += 0.033;
        if (_progressValue >= 1.0) {
          _timerEnd();
          if (widget.onLongTap != null) {
            widget.onLongTap!();
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onLongPressDown: (details) {
              _startProgress();
            },
            onLongPressCancel: () {
              _timerEnd();
            },
            onLongPressUp: () {
              _timerEnd();
            },
            child: const Padding(
              padding: EdgeInsets.all(16),
              child: Icon(
                Icons.menu,
              size: 32,
              ),
            ),
          ),
          if (_progressValue > 0)
            Positioned(
              bottom: 0,
              left: 0,
              child: CircleWidget(
                rad: 100,
                col: Colors.white,
                child: SizedBox(
                  width: 42,
                  height: 42,
                  child: CircularProgressIndicator(
                    value: _progressValue,
                    strokeWidth: 50,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
