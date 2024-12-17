import 'package:schools_map/config/core/exports.dart';

class FavoriteBtn extends StatefulWidget {
  bool isLiked;
  EdgeInsetsGeometry? pad;
  void Function(bool value)? onChange;
  BoxDecoration? decoration;
  MapEntry<Color, Color> colors;
  double radius;

  FavoriteBtn({
    this.isLiked = false,
    this.pad = const EdgeInsets.all(2),
    this.onChange,
    this.colors = const MapEntry(Colors.white, Colors.grey),
    this.decoration,
    this.radius = 25,
    super.key,
  });

  @override
  State<FavoriteBtn> createState() => _FavoriteBtnState();
}

class _FavoriteBtnState extends State<FavoriteBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.isLiked = !widget.isLiked;
        });
        if (widget.onChange != null) {
          widget.onChange!(widget.isLiked);
        }
      },
      child: Container(
        decoration: widget.decoration ??
            BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(50),
            ),
        padding: widget.pad,
        // rad: widget.radius,
        child: widget.isLiked
            ? Icon(
                Icons.favorite,
                color: widget.colors.key,
                size: 19,
              )
            : Icon(
                Icons.favorite_border,
                color: widget.colors.value,
                size: 19,
              ),
      ),
    );
  }
}
