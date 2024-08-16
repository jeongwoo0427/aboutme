import 'package:aboutme/cores/extensions/build_context_extension.dart';
import 'package:aboutme/ui/widgets/container/glassy_container.dart';
import 'package:flutter/material.dart';

class GlassySelectorItem {}

class GlassyDropDown extends StatefulWidget {
  final double width;
  final double height;
  final double fontSize;
  final TextStyle? textStyle;

  const GlassyDropDown({super.key, this.width = 100, this.height = 45, this.fontSize = 14, this.textStyle});

  @override
  State<GlassyDropDown> createState() => _GlassyDropDownState();
}

class _GlassyDropDownState extends State<GlassyDropDown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();

  final _link = LayerLink();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius defaultBorderRadius = BorderRadius.circular(10);
    final TextStyle defaultTextStyle = TextStyle(fontSize: 14,fontWeight: FontWeight.w500);

    return CompositedTransformTarget(
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
                child: _DropDownMenu(
                  width: widget.width,
                  height: widget.height,
                  borderRadius: defaultBorderRadius,
                  textStyle: widget.textStyle?? defaultTextStyle,
                ),
              ),
            ),
          );
        },
        child: _DropDownButton(
          onTap: _onTap,
          width: widget.width,
          height: widget.height,
          borderRadius: defaultBorderRadius,
          textStyle: widget.textStyle?? defaultTextStyle,
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
}

class _DropDownButton extends StatefulWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final BorderRadius borderRadius;
  final TextStyle textStyle;

  _DropDownButton({super.key, required this.width, required this.height, required this.onTap, required this.borderRadius, required this.textStyle});

  @override
  State<_DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<_DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return GlassyContainer(
        borderRadius: widget.borderRadius,
        blur: 0,
        width: widget.width,
        height: widget.height,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            hoverColor: context.colorScheme.onSurface.withOpacity(0.3),
            onHover: (_) {},
            onTap: widget.onTap,
            child: Center(
              child: Text(
                'Korean',
                style: widget.textStyle,
              ),
            ),
          ),
        ));
  }
}

class _DropDownMenu extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final TextStyle textStyle;

  _DropDownMenu({Key? key, required this.width, required this.height, required this.borderRadius, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 500),
      curve: Curves.decelerate,
      tween: Tween<double>(begin: height, end: height * 3+4),
      builder: (context, value, child) {
        return GlassyContainer(
          padding: EdgeInsets.zero,
          borderRadius: borderRadius,
          duration: Duration.zero,
          width: width,
          height: value,
          blur: 30,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _DropDownMenuItem(height: height,textStyle: textStyle,),
                _DropDownMenuItem(height: height,textStyle: textStyle),
                _DropDownMenuItem(height: height,textStyle: textStyle),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DropDownMenuItem extends StatelessWidget {
  final double height;
  final TextStyle textStyle;

  const _DropDownMenuItem({Key? key, required this.height, required this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
        child: InkWell(
          onTap: (){},
          onHover: (_){},
          hoverColor: colorScheme.onSurface.withOpacity(0.3),
          child: Container(
                height: height,
                child: Center(child: Text('Korean',style: textStyle,)),
              ),
        ));
  }
}
