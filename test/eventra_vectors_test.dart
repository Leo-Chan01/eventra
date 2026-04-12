import 'dart:io';

import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('eventra_vectors assets test', () {
    expect(
      File(EventraVectors.accountSecuredIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.addIconChatPage).existsSync(), isTrue);
    expect(File(EventraVectors.addIconRightSideChatPage).existsSync(), isTrue);
    expect(File(EventraVectors.addressIcon).existsSync(), isTrue);
    expect(File(EventraVectors.angleLeft).existsSync(), isTrue);
    expect(File(EventraVectors.angleRight).existsSync(), isTrue);
    expect(
      File(EventraVectors.appSettingsIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.appleIcon).existsSync(), isTrue);
    expect(File(EventraVectors.attachFileChatPage).existsSync(), isTrue);
    expect(File(EventraVectors.basilVideoOutlineClient).existsSync(), isTrue);
    expect(File(EventraVectors.calendarIcon).existsSync(), isTrue);
    expect(File(EventraVectors.callIcon).existsSync(), isTrue);
    expect(File(EventraVectors.cancelIconNoCircle).existsSync(), isTrue);
    expect(File(EventraVectors.cancelSearchIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.cautionBlackGreyIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(
      File(
        EventraVectors.cautionRedExclamationIconProfileSettings,
      ).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.cautionSignOrange).existsSync(), isTrue);
    expect(File(EventraVectors.chatBubbleIcon).existsSync(), isTrue);
    expect(File(EventraVectors.chatMessageRedbadge).existsSync(), isTrue);
    expect(File(EventraVectors.chatMessage).existsSync(), isTrue);
    expect(File(EventraVectors.checkmarkGreyBlackDark).existsSync(), isTrue);
    expect(
      File(EventraVectors.checkmarkSolidGreenIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.clientVector).existsSync(), isTrue);
    expect(File(EventraVectors.copyBlackIcon).existsSync(), isTrue);
    expect(File(EventraVectors.copyIconWhiteBg).existsSync(), isTrue);
    expect(File(EventraVectors.creditCardBlueGbIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.deleteAccountIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.editPencilElevated).existsSync(), isTrue);
    expect(File(EventraVectors.eventraBlackText).existsSync(), isTrue);
    expect(File(EventraVectors.eventraPrimaryText).existsSync(), isTrue);
    expect(File(EventraVectors.eyeViewsIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.feedbackChatBubbleIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.filterIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.goodCheckGreenDottedCircle).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.goodCheckGreen).existsSync(), isTrue);
    expect(File(EventraVectors.googleIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.helpSupportIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.homeIconSearchNew).existsSync(), isTrue);
    expect(File(EventraVectors.homeIcon).existsSync(), isTrue);
    expect(File(EventraVectors.homeIconSearch).existsSync(), isTrue);
    expect(File(EventraVectors.infoIconOrange).existsSync(), isTrue);
    expect(File(EventraVectors.infoIcon).existsSync(), isTrue);
    expect(File(EventraVectors.locationPinLineIcon).existsSync(), isTrue);
    expect(File(EventraVectors.locationPin).existsSync(), isTrue);
    expect(File(EventraVectors.logoutIconProfileSettings).existsSync(), isTrue);
    expect(File(EventraVectors.loveButtonVendorDeets).existsSync(), isTrue);
    expect(File(EventraVectors.loveVendorDeets).existsSync(), isTrue);
    expect(File(EventraVectors.mageShareVideoIcon).existsSync(), isTrue);
    expect(File(EventraVectors.mailIcon).existsSync(), isTrue);
    expect(File(EventraVectors.messageMailIcon).existsSync(), isTrue);
    expect(File(EventraVectors.messagesChatBlackGrey).existsSync(), isTrue);
    expect(File(EventraVectors.messages).existsSync(), isTrue);
    expect(File(EventraVectors.microphoneChatPageIcon).existsSync(), isTrue);
    expect(File(EventraVectors.nairaSymbol).existsSync(), isTrue);
    expect(File(EventraVectors.nextPageArrowIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.notificaionBellIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.notificationBellNobadge).existsSync(), isTrue);
    expect(File(EventraVectors.notificationBell).existsSync(), isTrue);
    expect(File(EventraVectors.outgoingRedIcon).existsSync(), isTrue);
    expect(File(EventraVectors.pendingIconOrgange).existsSync(), isTrue);
    expect(
      File(EventraVectors.personalInformationIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.playWhiteIconPlay).existsSync(), isTrue);
    expect(
      File(EventraVectors.privacySecurityIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.redCancelIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.savedVendorsIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.searchNormal).existsSync(), isTrue);
    expect(File(EventraVectors.sendIconChatPage).existsSync(), isTrue);
    expect(File(EventraVectors.shareButtonVendorDeets).existsSync(), isTrue);
    expect(File(EventraVectors.shopIcon).existsSync(), isTrue);
    expect(File(EventraVectors.showcaseIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.solarLikeBrokenSaveVideoIcon).existsSync(),
      isTrue,
    );
    expect(
      File(EventraVectors.starUnfilledRatingIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.starVector).existsSync(), isTrue);
    expect(File(EventraVectors.stickynote).existsSync(), isTrue);
    expect(
      File(EventraVectors.streamlineUltimateLikeBold).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.supportIconEnquiries).existsSync(), isTrue);
    expect(
      File(EventraVectors.switchToVendorIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(
      File(
        EventraVectors.transparentGreenCheckIconIconProfileSettings,
      ).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.vendorVector).existsSync(), isTrue);
    expect(File(EventraVectors.verify).existsSync(), isTrue);
    expect(
      File(EventraVectors.weLoveYourFeedbackIconProfileSettings).existsSync(),
      isTrue,
    );
    expect(File(EventraVectors.whitePencilSingleOnlyIcon).existsSync(), isTrue);
    expect(
      File(EventraVectors.yourPrivacyMattersIconProfileSettings).existsSync(),
      isTrue,
    );
  });
}
