import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomDropdown extends StatefulWidget {
  final String text;

  const CustomDropdown({Key? key, required this.text}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.text);
    super.initState();
  }

  void findDropdownData() {
    RenderBox renderBox =
        actionKey.currentContext!.findRenderObject() as RenderBox;
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: width,
        top: yPosition + height,
        height: 4 * height + 40,
        child: DropDown(
          itemHeight: height,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (isDropdownOpened) {
            floatingDropdown.remove();
          } else {
            findDropdownData();
            floatingDropdown = _createFloatingDropdown();
            Overlay.of(context)!.insert(floatingDropdown);
          }

          isDropdownOpened = !isDropdownOpened;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            Text(
              widget.text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
            ),
            const Spacer(),
            const Icon(
              IconlyLight.arrow_right_2,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}

class DropDown extends StatelessWidget {
  final double itemHeight;

  const DropDown({Key? key, required this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 5,
        ),
        Align(
          alignment: const Alignment(-0.85, 0),
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              height: 20,
              width: 30,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
        ),
        Material(
          elevation: 20,
          child: Container(
            height: 4 * itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: <Widget>[
                DropDownItem.first(
                  text: "Item 1",
                  isSelected: false,
                ),
                const DropDownItem(
                  text: "Item 2",
                  isSelected: false,
                ),
                const DropDownItem(
                  text: "Item 3",
                  isSelected: false,
                ),
                DropDownItem.last(
                  text: "Item 4",
                  isSelected: true,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final bool isFirstItem;
  final bool isLastItem;

  const DropDownItem(
      {Key? key,
      required this.text,
      this.isSelected = false,
      this.isFirstItem = false,
      this.isLastItem = false})
      : super(key: key);

  factory DropDownItem.first({required String text, required bool isSelected}) {
    return DropDownItem(
      text: text,
      isSelected: isSelected,
      isFirstItem: true,
    );
  }

  factory DropDownItem.last({String? text, bool? isSelected}) {
    return DropDownItem(
      text: text!,
      isSelected: isSelected!,
      isLastItem: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: isFirstItem ? const Radius.circular(4) : Radius.zero,
          bottom: isLastItem ? const Radius.circular(4) : Radius.zero,
        ),
        color: isSelected ? Colors.white : Colors.white70,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: <Widget>[
          Text(
            text.toLowerCase(),
            style: const TextStyle(color: Colors.black, fontSize: 12),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArrowShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return getClip(rect.size);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }
}
