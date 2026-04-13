import 'package:eventra/features/client/client_inbox/domain/models/chat_message.dart';
import 'package:eventra/features/client/client_inbox/presentation/widgets/chat_bubble.dart';
import 'package:eventra/features/client/vendor_details/domain/models/catalog_item.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../helpers/helpers.dart';

void main() {
  group('ChatBubble', () {
    testWidgets('renders in-review status with action', (tester) async {
      const message = ChatMessage(
        id: 'review-1',
        text:
            'You will get a notification once Pozera Event review your enquiry.',
        isFromClient: false,
        time: '1:32 PM',
        type: ChatMessageType.statusInReview,
        showStatusAction: true,
      );

      await tester.pumpApp(const ChatBubble(message: message));

      expect(find.text(message.text), findsOneWidget);
      expect(find.text('View profile'), findsOneWidget);
    });

    testWidgets('renders enquiry message as enquiry card', (tester) async {
      const message = ChatMessage(
        id: 'enquiry-1',
        text: 'I want to make enquiry on this package',
        isFromClient: true,
        time: '1:32 PM',
        type: ChatMessageType.enquiry,
        enquiryAttachment: CatalogItem(
          id: 'catalog-001',
          title: 'Pre-wedding Photoshoot',
          description: 'Capture your story.',
          price: 450000,
          image: EventraImages.weddingImage,
          whatToExpect: ['Edited photos'],
        ),
      );

      await tester.pumpApp(const ChatBubble(message: message));

      expect(find.text('Pre-wedding Photoshoot'), findsOneWidget);
      expect(
        find.text('I want to make enquiry on this package'),
        findsOneWidget,
      );
      expect(find.text('View'), findsOneWidget);
    });
  });
}
