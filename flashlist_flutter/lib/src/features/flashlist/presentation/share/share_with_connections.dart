import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flashlist_client/flashlist_client.dart';
import 'package:flashlist_flutter/src/constants/app_sizes.dart';
import 'package:flashlist_flutter/src/features/users/application/user_controller.dart';
import 'package:flashlist_flutter/src/features/users/presentation/avatar_placeholder.dart';
import 'package:flashlist_flutter/src/shared/async_value_widget.dart';

class ShareWithConnections extends ConsumerWidget {
  const ShareWithConnections(this.flashlist, {super.key});

  final Flashlist flashlist;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget(
      value: ref.watch(connectionsProvider),
      data: (connections) {
        return ListView.builder(
          itemCount: connections.length,
          itemBuilder: (context, index) {
            final connection = connections[index];
            return ListTile(
              leading: AvatarPlaceholder(
                radius: Sizes.p20,
                username: connection!.username,
              ),
              title: Text(connection.username),
              onTap: () {
                // ref.read(flashlistControllerProvider).addUserToFlashlist(
                //       FlashlistAddUser(
                //         user: connection,
                //         listId: flashlist.id!,
                //         accessLevel: 'editor',
                //       ),
                //     );
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}