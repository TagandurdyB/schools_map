import 'package:schools_map/config/core/exports.dart';

class RadioItem<T> {
  Widget child;
  T value;
  RadioItem({
    required this.value,
    required this.child,
  });
}

typedef ValueChanged<T> = void Function(dynamic value);

class RadioGroup<T> extends StatefulWidget {
  final List<RadioItem<T>> items;
  final ValueChanged<T>? onSelect;
  const RadioGroup({
    required this.items,
    this.onSelect,
    super.key,
  });

  @override
  State<RadioGroup> createState() => _RadioGroupState<T>();
}

class _RadioGroupState<T> extends State<RadioGroup> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.items.map((e) {
        return GestureDetector(
          onTap: () {
            // if (widget.onSelect != null) {}
            // final onSelect=widget.onSelect as void Function(T);
        
            widget.onSelect?.call(e.value);
          },
          child: e.child,
        );
      }).toList(),
    );
  }
}
