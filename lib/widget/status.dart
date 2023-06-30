import 'package:flutter/material.dart';

enum TipeStatus { menunggu, diterima, ditolak }

class Status extends StatelessWidget {
  const Status({
    super.key,
    this.type = TipeStatus.menunggu,
    this.isExpand = false,
    this.isElevated = false,
  });

  final TipeStatus type;
  final bool isExpand;
  final bool isElevated;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
