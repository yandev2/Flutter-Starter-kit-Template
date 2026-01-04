import 'dart:async';
import 'package:flutter/material.dart';

enum AsyncState { initial, loading, error, data }

class CustomStreamBuilder<T> extends StatefulWidget {
  final Stream<T> Function() streamProvider;
  final Widget Function(BuildContext, T) dataBuilder;
  final Widget Function(BuildContext) loadingBuilder;
  final Widget Function(BuildContext, Object?) errorBuilder;

  const CustomStreamBuilder({
    super.key,
    required this.streamProvider,
    required this.dataBuilder,
    required this.loadingBuilder,
    required this.errorBuilder,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomStreamBuilderState<T> createState() => _CustomStreamBuilderState<T>();
}

class _CustomStreamBuilderState<T> extends State<CustomStreamBuilder<T>> {
  AsyncState _asyncState = AsyncState.initial;
  late T _data;
  Object? _error;
  StreamSubscription<T>? _subscription;

  @override
  void initState() {
    super.initState();
    _listenStream();
  }

  void _listenStream() {
    setState(() {
      _asyncState = AsyncState.loading;
    });

    _subscription = widget.streamProvider().listen(
      (event) {
        if (mounted) {
          setState(() {
            _asyncState = AsyncState.data;
            _data = event;
          });
        }
      },
      onError: (err) {
        if (mounted) {
          setState(() {
            _asyncState = AsyncState.error;
            _error = err;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (_asyncState) {
      case AsyncState.loading:
        return widget.loadingBuilder(context);
      case AsyncState.error:
        return widget.errorBuilder(context, _error);
      case AsyncState.data:
        return widget.dataBuilder(context, _data);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
