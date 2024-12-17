import 'package:schools_map/config/core/exports.dart';

class LoadingBtn extends StatefulWidget {
  final Future Function()? onTab;
  final String text;
  final Widget? ch;
  const LoadingBtn({
    this.onTab,
    this.text = '',
    this.ch,
    super.key,
  });

  @override
  State<LoadingBtn> createState() => _LoadingBtnState();
}

class _LoadingBtnState extends State<LoadingBtn> {
  bool isLoading = false;
  Size? _size;

  void onSave() {
    if (widget.onTab != null) {
      setState(() => isLoading = true);
      widget.onTab!().then((_) {
        try {
          setState(() => isLoading = false);
        } catch (_) {}
        {}
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const SizedBox(
          height: 35, width: 35, child: CircularProgressIndicator());
    } else if (widget.ch == null) {
      final tc = TC(context);
      return MaterialButton(
        onPressed: onSave,
        color: tc.cols.grey200,
        child: tc.texts.bodyText(widget.text, col: Colors.white),
      );
    } else {
      return SizedBox(
        // width: _size?.width,
        // height: _size?.height,
        child: SizeReportingWidget(
          onSizeChange: (size) => _size = size,
          child: GestureDetector(onTap: onSave, child: widget.ch),
        ),
      );
    }
  }
}
