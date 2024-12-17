

import 'package:schools_map/config/core/exports.dart';

class ProgresBtn extends StatefulWidget {
  final Widget? ch;
  final String? text;
  final String? noticeTitle;
  final String? noticeBody;
  final bool isCircle;
  final double? rad;
  final Future Function(
    Function(int count, int total) onSetProgress,
  )? onProgress;
  const ProgresBtn({
    this.ch,
    this.text,
    this.noticeTitle = 'Progress done!',
    this.noticeBody,
    this.isCircle = false,
    this.rad = 25,
    this.onProgress,
    super.key,
  });

  @override
  State<ProgresBtn> createState() => _ProgresBtnState();
}

class _ProgresBtnState extends State<ProgresBtn> {
  double? presentage;

  late TC tc;
  @override
  Widget build(BuildContext context) {
    tc = TC(context);
    return GestureDetector(
      onTap: widget.onProgress == null
          ? null
          : () async {
              widget.onProgress!(
                (count, total) {
                  debugPrint("Progress: count:=$count   total:=$total");
                  setState(() {
                    if (count == total) {
                      presentage = null;
                    } else {
                      presentage = (count / total);
                    }
                  });
                },
              )
                  .then((value) {
                if (widget.noticeTitle == null) return;
                // NotificationService.showLocalNotification(NotificationModel(
                //   id: 10,
                //   title: widget.noticeTitle,
                //   body: widget.noticeBody,
                // ));
              });
            },
      child: presentage == null
          ? widget.ch ??
              InCard(
                  col: Colors.green,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.download,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: tc.texts.smallBodyText(widget.text ?? 'Progress',
                            col: Colors.white, maxLines: 3),
                      ),
                    ],
                  ))
          : widget.isCircle
              ? buildCircle()
              : buildProgres(),
    );
  }

  Widget buildCircle() {
    return SizedBox(
      width: widget.rad,
      height: widget.rad,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(value: presentage),
          Text(
            "${((presentage ?? 0) * 100).round()}%",
            style: const TextStyle(fontSize: 9),
          ),
        ],
      ),
    );
  }

  Widget buildProgres() {
    return Stack(
      alignment: Alignment.center,
      children: [
        LinearProgressIndicator(
          value: presentage,
          minHeight: 20,
          borderRadius: BorderRadius.circular(8),
        ),
        Center(
          child: tc.texts.bodyText(
            "${((presentage ?? 0) * 100).round()}%",
            col: Colors.white,
          ),
        ),
      ],
    );
  }
}
