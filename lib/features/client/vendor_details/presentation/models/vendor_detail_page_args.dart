class VendorDetailPageArgs {
  const VendorDetailPageArgs({
    this.vendorId,
    this.initialTabIndex = 0,
    this.isVendorMode = false,
  });

  final String? vendorId;
  final int initialTabIndex;
  final bool isVendorMode;
}
