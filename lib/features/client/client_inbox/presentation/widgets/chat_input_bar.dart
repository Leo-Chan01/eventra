import 'package:eventra/core/utils/num_extensions.dart';
import 'package:eventra/l10n/l10n.dart';
import 'package:eventra/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatInputBar extends StatefulWidget {
  const ChatInputBar({
    required this.controller,
    required this.onChanged,
    required this.onSend,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onSend;

  @override
  State<ChatInputBar> createState() => _ChatInputBarState();
}

class _ChatInputBarState extends State<ChatInputBar> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 24),
      color: colorScheme.surface,
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: widget.controller,
        builder: (context, textValue, _) {
          final isTyping = textValue.text.isNotEmpty;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Offstage(
                offstage: !isTyping,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    EventraVectors.addIconChatPage,
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              Offstage(
                offstage: !isTyping,
                child: 10.horizSpacing,
              ),
              Expanded(
                child: TextField(
                  focusNode: _focusNode,
                  controller: widget.controller,
                  onChanged: (value) => widget.onChanged(value),
                  style: 14.w400.copyWith(color: colorScheme.onSurface),
                  decoration: InputDecoration(
                    hintText: l10n.chatInputHint,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              10.horizSpacing,
              Offstage(
                offstage: !isTyping,
                child: GestureDetector(
                  onTap: widget.onSend,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        EventraVectors.sendIconChatPage,
                        width: 22,
                        height: 22,
                        colorFilter: ColorFilter.mode(
                          colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Offstage(
                offstage: isTyping,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    EventraVectors.addIconRightSideChatPage,
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              8.horizSpacing,
              Offstage(
                offstage: isTyping,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    EventraVectors.attachFileChatPage,
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              8.horizSpacing,
              Offstage(
                offstage: isTyping,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(
                    EventraVectors.microphoneChatPageIcon,
                    width: 22,
                    height: 22,
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSurfaceVariant,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
