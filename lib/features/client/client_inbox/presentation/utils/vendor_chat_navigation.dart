import 'package:eventra/features/client/client_inbox/presentation/bloc/client_inbox_bloc.dart';
import 'package:eventra/features/client/client_inbox/presentation/pages/chat_page.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<void> openVendorChat({
  required BuildContext context,
  required String vendorId,
  required String vendorName,
  required CatalogItem catalogItem,
}) async {
  context.read<ClientInboxBloc>().add(
    InboxVendorStarted(
      vendorId: vendorId,
      vendorName: vendorName,
      catalogItem: catalogItem,
    ),
  );

  await context.pushNamed(ChatPage.name);
}
