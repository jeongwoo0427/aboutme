import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';

class GlassyDropdownButtonItem {
  GlassyDropdownButtonItem({required this.value, required this.text});

  final dynamic value;
  final String text;
}

class GlassyDropdownButton extends StatefulWidget {
  final double width;
  final double height;
  final TextStyle? textStyle;
  final dynamic initValue;
  final Function(GlassyDropdownButtonItem)? onChanged;
  final List<GlassyDropdownButtonItem> items;

  const GlassyDropdownButton(
      {super.key,
      this.width = 100,
      this.height = 45,
      this.textStyle,
      this.initValue,
      this.onChanged,
      required this.items});

  @override
  State<GlassyDropdownButton> createState() => _GlassyDropdownButtonState();
}

class _GlassyDropdownButtonState extends State<GlassyDropdownButton> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();

  dynamic _currentValue;

  @override
  void initState() {
    if (widget.initValue != null) {
      _currentValue = widget.initValue;
    } else {
      _currentValue = widget.items.first.value;
    }

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(10);


    return DefaultTextStyle(
      style:  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      child: CompositedTransformTarget(
        link: _link,
        child: OverlayPortal(
          controller: _tooltipController,
          overlayChildBuilder: (BuildContext context) {
            return CompositedTransformFollower(
              link: _link,
              targetAnchor: Alignment.topLeft,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: TapRegion(
                  onTapOutside: _onTapOutSide,
                  child: _DropdownMenu(
                    width: widget.width,
                    height: widget.height,
                    borderRadius: defaultBorderRadius,
                    textStyle: widget.textStyle,
                    currentValue: _currentValue,
                    items: widget.items,
                    onTap: _onTapItem,
                  ),
                ),
              ),
            );
          },
          child: _DropdownButton(
            onTap: _onTap,
            width: widget.width,
            height: widget.height,
            borderRadius: defaultBorderRadius,
            textStyle: widget.textStyle,
            text: widget.items.firstWhere((e)=>e.value==_currentValue).text,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (_tooltipController.isShowing) {
      _tooltipController.hide();
    } else {
      _tooltipController.show();
    }
  }

  void _onTapOutSide(PointerDownEvent event) {
    if (_tooltipController.isShowing) {
      _tooltipController.hide();
    }
  }

  void _onTapItem(GlassyDropdownButtonItem selectedItem) {
    if(selectedItem.value == _currentValue){
      return;
    }

    setState(() {
      _currentValue = selectedItem.value;
    });
    if (widget.onChanged != null) {
      widget.onChanged!(selectedItem);
    }
    _tooltipController.hide();
  }
}

class _DropdownButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final String text;

  _DropdownButton(
      {super.key,
      required this.width,
      required this.height,
      required this.onTap,
      required this.borderRadius,
      required this.textStyle,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GlassyContainer(
        borderRadius: borderRadius,
        blur: 0,
        width: width,
        height: height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: context.colorScheme.onSurface.withOpacity(0.3),
            onHover: (_) {},
            onTap: onTap,
            child: Center(
              child: Text(
                text,
                style: textStyle,
              ),
            ),
          ),
        ));
  }
}

class _DropdownMenu extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final dynamic currentValue;
  final List<GlassyDropdownButtonItem> items;
  final Function(GlassyDropdownButtonItem) onTap;

  _DropdownMenu(
      {Key? key,
      required this.width,
      required this.height,
      required this.borderRadius,
      required this.textStyle,
      required this.currentValue,
      required this.items,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlassyDropdownButtonItem firstItem =
        items.firstWhere((e) => e.value == currentValue);
    final List<GlassyDropdownButtonItem> newItems =
        items.where((e) => e.value != currentValue).toList();
    newItems.insert(0, firstItem);

    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      curve: Curves.decelerate,
      tween: Tween<double>(begin: height, end: height * items.length + 4),
      builder: (context, value, child) {
        return GlassyContainer(
          padding: EdgeInsets.zero,
          borderRadius: borderRadius,
          duration: Duration.zero,
          width: width,
          height: value,
          blur: 30,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: newItems
                  .map((e) => _DropdownMenuItem(
                        height: height,
                        textStyle: textStyle,
                        item: e,
                        onTap: onTap,
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}

class _DropdownMenuItem extends StatelessWidget {
  final double height;
  final TextStyle? textStyle;
  final GlassyDropdownButtonItem item;
  final Function(GlassyDropdownButtonItem) onTap;

  const _DropdownMenuItem(
      {Key? key,
      required this.height,
      required this.textStyle,
      required this.item,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(item),
          onHover: (_) {},
          hoverColor: colorScheme.onSurface.withOpacity(0.3),
          child: Container(
            height: height,
            child: Center(
                child: Text(
              item.text,
              style: textStyle,
            )),
          ),
        ));
  }
}
