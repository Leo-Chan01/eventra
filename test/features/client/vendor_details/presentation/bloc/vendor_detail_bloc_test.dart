import 'package:bloc_test/bloc_test.dart';
import 'package:eventra/features/client/vendor_details/presentation/bloc/vendor_detail_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('VendorDetailBloc', () {
    test('initial state seeds 4 vendors', () {
      final bloc = VendorDetailBloc();
      addTearDown(bloc.close);

      expect(bloc.state.vendors, hasLength(4));
      expect(bloc.state.selectedTab, 0);
    });

    test('initial selected vendor defaults to first vendor', () {
      final bloc = VendorDetailBloc();
      addTearDown(bloc.close);

      expect(bloc.state.selectedVendorId, bloc.state.vendors.first.id);
      expect(bloc.state.selectedVendor.id, bloc.state.vendors.first.id);
    });

    blocTest<VendorDetailBloc, VendorDetailState>(
      'VendorSelected updates selectedVendorId',
      build: VendorDetailBloc.new,
      act: (bloc) => bloc.add(const VendorSelected('vendor-002')),
      expect: () => [
        isA<VendorDetailState>().having(
          (s) => s.selectedVendorId,
          'selectedVendorId',
          'vendor-002',
        ),
      ],
      verify: (bloc) {
        expect(bloc.state.selectedVendor.name, 'Swift Pixel');
      },
    );

    blocTest<VendorDetailBloc, VendorDetailState>(
      'VendorDetailTabChanged updates selectedTab',
      build: VendorDetailBloc.new,
      act: (bloc) => bloc.add(const VendorDetailTabChanged(2)),
      expect: () => [
        isA<VendorDetailState>().having(
          (s) => s.selectedTab,
          'selectedTab',
          2,
        ),
      ],
    );

    blocTest<VendorDetailBloc, VendorDetailState>(
      'vendor selection resets selected tab to zero',
      build: VendorDetailBloc.new,
      act: (bloc) => bloc
        ..add(const VendorDetailTabChanged(3))
        ..add(const VendorSelected('vendor-003')),
      expect: () => [
        isA<VendorDetailState>().having((s) => s.selectedTab, 'tab', 3),
        isA<VendorDetailState>()
            .having((s) => s.selectedVendorId, 'vendorId', 'vendor-003')
            .having((s) => s.selectedTab, 'tab', 0),
      ],
    );

    blocTest<VendorDetailBloc, VendorDetailState>(
      'selected vendor has catalog items',
      build: VendorDetailBloc.new,
      act: (bloc) => bloc.add(const VendorSelected('vendor-001')),
      verify: (bloc) {
        expect(bloc.state.selectedVendor.catalogItems, isNotEmpty);
        expect(bloc.state.selectedVendor.reviews, isNotEmpty);
      },
    );

    test(
      'pozera vendor seeds catalog gallery images and structured videos',
      () {
        final bloc = VendorDetailBloc();
        addTearDown(bloc.close);

        final vendor = bloc.state.vendors.firstWhere(
          (v) => v.id == 'vendor-001',
        );
        final galleryItem = vendor.catalogItems.firstWhere(
          (item) => item.id == 'cat-002',
        );

        expect(galleryItem.images, isNotEmpty);
        expect(vendor.videos, isNotEmpty);
        expect(vendor.videos.first.viewCount, greaterThan(0));
      },
    );
  });
}
