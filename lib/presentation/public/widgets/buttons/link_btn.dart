import 'package:schools_map/config/core/exports.dart';

class LikeBtn extends StatefulWidget {
  final Widget liked;
  final Widget? unLiked;
  final Future<bool>? Function(bool isLike)? onTap;
  final Color bgCol;
  final EdgeInsetsGeometry pad;
  bool isLiked;
  LikeBtn({
    Key? key,
    required this.liked,
    this.unLiked,
    this.onTap,
    this.bgCol = Colors.blue,
    this.pad = const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
    this.isLiked = false,
  }) : super(key: key);

  @override
  State<LikeBtn> createState() => _LikeBtnState();
}

class _LikeBtnState extends State<LikeBtn> {
  bool _isLoad = false;

  @override
  Widget build(BuildContext context) {
    return _isLoad
        ? const SizedBox(
            width: 30, height: 30, child: CircularProgressIndicator())
        : InBtn(
            onTap: () async {
              if (widget.onTap != null) {
                setState(() => _isLoad = true);
                final canDo = await widget.onTap!(widget.isLiked);
                if (canDo == true) {
                  setState(() => widget.isLiked = !widget.isLiked);
                }
                setState(() => _isLoad = false);
              } else {
                setState(() => widget.isLiked = !widget.isLiked);
              }
            },
            rad: 6,
            pad: widget.pad,
            col: widget.bgCol,
            child:
                widget.isLiked ? widget.liked : widget.unLiked ?? widget.liked,
          );
  }
}
