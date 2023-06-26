import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:landlord/ui/resource/colors.dart';
import 'package:landlord/ui/resource/styles.dart';

class Button extends StatefulWidget {
  final Widget Function(BuildContext) builder;
  final BoxDecoration Function(BuildContext)? decorationBuilder;
  final Color splashColor;

  final VoidCallback? onTap;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry padding;

  const Button._(
    this.builder, {
    this.decorationBuilder,
    Color? splashColor,
    this.onTap,
    this.constraints,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    Key? key,
  })  : this.splashColor = splashColor ?? ResoureColors.grey,
        super(key: key);

  factory Button.outlineWIdget(
    Widget widget, {
    VoidCallback? onTap,
    BoxConstraints? constraints,
    Key? key,
  }) =>
      Button._(
        (context) => widget,
        decorationBuilder: (context) => BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2,
          ),
        ),
        onTap: onTap,
        constraints: constraints,
        key: key,
      );

  factory Button.outline(
    String title, {
    Color? textColor,
    Color? color,
    VoidCallback? onTap,
    BoxConstraints? constraints,
    Key? key,
  }) =>
      Button._(
        (context) => Text(
          title,
          style: ResourceTextStyle.medium.copyWith(color: textColor),
          textAlign: TextAlign.center,
        ),
        decorationBuilder: (context) => BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 2,
            color: color == null ? ResourceTextStyle.COLOR : color,
          ),
        ),
        onTap: onTap,
        constraints: constraints,
        key: key,
      );

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      splashColor: widget.splashColor,
      borderRadius: (widget.decorationBuilder != null) ? BorderRadius.all(Radius.circular(25)) : null,
      child: Container(
        padding: widget.padding,
        alignment: Alignment.center,
        child: widget.builder(context),
        decoration: widget.decorationBuilder?.call(context),
        constraints: widget.constraints,
      ),
    );
  }
}
