import 'package:eventra/features/home/domain/models/home_search_event_item.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';

class HomeSearchEventSeed {
  const HomeSearchEventSeed._();

  static List<HomeSearchEventItem> fromL10n(AppLocalizations l10n) {
    return [
      HomeSearchEventItem(
        imagePath: EventraImages.weddingImage,
        category: l10n.homeSearchEventsCategoryMusic,
        title: l10n.homeSearchEventsTitleMusic,
        description: l10n.homeSearchEventsDescriptionMusic,
        price: l10n.homeSearchEventsPricePaid,
        location: l10n.homeSearchEventsLocationDowntown,
        dateTime: l10n.homeSearchEventsDateMusic,
      ),
      HomeSearchEventItem(
        imagePath: EventraImages.womanWithfoodplate,
        category: l10n.homeSearchEventsCategoryFood,
        title: l10n.homeSearchEventsTitleFood,
        description: l10n.homeSearchEventsDescriptionFood,
        price: l10n.homeSearchEventsPriceFree,
        location: l10n.homeSearchEventsLocationCentralPark,
        dateTime: l10n.homeSearchEventsDateFood,
      ),
      HomeSearchEventItem(
        imagePath: EventraImages.womanWithfoodplate,
        category: l10n.homeSearchEventsCategoryFood,
        title: l10n.homeSearchEventsTitleFood,
        description: l10n.homeSearchEventsDescriptionFood,
        price: l10n.homeSearchEventsPriceFree,
        location: l10n.homeSearchEventsLocationCentralPark,
        dateTime: l10n.homeSearchEventsDateFood,
      ),
      HomeSearchEventItem(
        imagePath: EventraImages.womanWithfoodplate,
        category: l10n.homeSearchEventsCategoryFood,
        title: l10n.homeSearchEventsTitleFood,
        description: l10n.homeSearchEventsDescriptionFood,
        price: l10n.homeSearchEventsPriceFree,
        location: l10n.homeSearchEventsLocationCentralPark,
        dateTime: l10n.homeSearchEventsDateFood,
      ),
    ];
  }
}
