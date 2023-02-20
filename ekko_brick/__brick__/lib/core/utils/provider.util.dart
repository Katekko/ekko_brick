import 'package:flutter/material.dart';

class EntryProvider extends StatefulWidget {
  const EntryProvider({
    Key? key,
    required this.onBuild,
    this.onInit,
    this.onDispose,
    this.onDidChangeDependencies,
    this.onActivate,
    this.onDidUpdateWidget,
    this.onDeActive,
  }) : super(key: key);

  final void Function(BuildContext context)? onInit;
  final Widget Function(BuildContext context) onBuild;
  final void Function(BuildContext context)? onDispose;

  final void Function(BuildContext context)? onDidChangeDependencies;

  final void Function(BuildContext context)? onActivate;

  final void Function(Widget oldWidget, BuildContext context)?
      onDidUpdateWidget;

  final void Function(BuildContext context)? onDeActive;

  @override
  State<EntryProvider> createState() => _EntryProviderState();
}

class _EntryProviderState extends State<EntryProvider> {
  @override
  void initState() {
    widget.onInit?.call(context);
    super.initState();
  }

  @override
  void dispose() {
    widget.onDispose?.call(context);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    widget.onDidChangeDependencies?.call(context);
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant EntryProvider oldWidget) {
    widget.onDidUpdateWidget?.call(oldWidget, context);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    widget.onDeActive?.call(context);

    super.deactivate();
  }

  @override
  void activate() {
    widget.onActivate?.call(context);
    super.activate();
  }

  @override
  Widget build(BuildContext context) => widget.onBuild.call(context);
}
