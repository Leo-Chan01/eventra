import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:eventra/features/client/vendor_details/presentation/models/vendor_detail_page_args.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorDetailEntry extends StatefulWidget {
  const VendorDetailEntry({
    required this.args,
    required this.child,
    super.key,
  });

  final VendorDetailPageArgs args;
  final Widget child;

  @override
  State<VendorDetailEntry> createState() => _VendorDetailEntryState();
}

class _VendorDetailEntryState extends State<VendorDetailEntry> {
  bool _didSyncInitialState = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didSyncInitialState) {
      return;
    }

    final bloc = context.read<VendorDetailBloc>();
    final args = widget.args;

    if (args.vendorId != null && args.vendorId!.isNotEmpty) {
      bloc.add(VendorSelected(args.vendorId!));
    }

    if (args.initialTabIndex != 0) {
      bloc.add(VendorDetailTabChanged(args.initialTabIndex));
    }

    _didSyncInitialState = true;
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
