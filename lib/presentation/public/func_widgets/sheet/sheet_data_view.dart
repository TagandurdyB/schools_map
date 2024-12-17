// ignore_for_file: must_be_immutable

part of 'my_sheet.dart';

class SheetObj {
  final String text;
  final Widget? child;
  final Object obj;
  SheetObj({
    required this.text,
    this.child,
    required this.obj,
  });
}

class SheetDataView extends StatefulWidget {
  List<SheetObj> objs;
  final String title;
  final bool search;
  final double? height;
  final bool selectCheck;
  final Widget Function(Widget child)? builder;

  final void Function(SheetObj obj)? onChange;
  SheetDataView({
    this.title = "",
    required this.objs,
    this.search = false,
    this.selectCheck = true,
    this.onChange,
    this.height,
    this.builder,
    super.key,
  });

  @override
  State<SheetDataView> createState() => _SheetDataViewState();
}

class _SheetDataViewState extends State<SheetDataView> {
  int _selectIndex = -1;
  late List<SheetObj> objs;

  @override
  void initState() {
    print("+++++++++++123");
    objs = List<SheetObj>.from(widget.objs);
    super.initState();
  }

  void _select(int index) {
    setState(() {
      _selectIndex = index;
    });
    if (widget.onChange != null) widget.onChange!(widget.objs[index]);
  }

  void _search(String value) {
    setState(() {
      final list = objs
          .where((element) =>
              element.text.toLowerCase().contains(value.toLowerCase()))
          .toList();
      widget.objs = list;
    });
  }

  late TC tC;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    tC = TC(context);
    return Container(
      margin: EdgeInsets.only(top: mediaQuery.padding.top),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: tC.texts.heading3(
                  widget.title,
                  maxLines: 2,
                ),
              ),
              IconButton(
                  onPressed: () {
                    Go.pop(args: [false]);
                  },
                  icon: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 15),
          Visibility(
              visible: widget.search,
              child: InputWidget(
                // key: Keys.searchInput,
                hidden: 'Search...',// search,
                tag: RInput.dataSheet,
                onChanged: _search,
                inputAction: TextInputAction.search,
              )),
          const SizedBox(height: 15),
          ...widget.builder != null
              ? [widget.builder!(buildContent())]
              : [
                  Flexible(child: buildContent()),
                  SizedBox(
                    height: mediaQuery.viewInsets.bottom +
                        mediaQuery.padding.bottom,
                  ),
                ],
        ],
      ),
    );
  }

  SizedBox buildContent() {
    return SizedBox(
      height: widget.height ?? MySize.height * 0.4,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.objs.length,
        itemBuilder: (context, index) {
          final isSelect = widget.selectCheck ? _selectIndex == index : false;
          final obj = widget.objs[index];
          return obj.child != null
              ? obj.child!
              : GestureDetector(
                  onTap: () => _select(index),
                  child: Container(
                    decoration: BoxDecoration(
                        border: BorderDirectional(
                      bottom: BorderSide(color: tC.cols.grey60),
                    )),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      children: [
                        Expanded(
                          child: tC.texts.bodyText(
                            obj.text,
                            col: isSelect ? tC.cols.orange300 : null,
                            maxLines: 2,
                          ),
                        ),
                        Visibility(
                          visible: isSelect,
                          child: Icon(Icons.check, color: tC.cols.orange300),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
