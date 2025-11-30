import 'package:flutter/material.dart';
import 'package:qubit_ov/shared/ui/auth/user_actions.dart';

class QubitAppbar {
  PreferredSizeWidget appBar(
    BuildContext context,
    String title,
    int icon,
    bool showActions,
  ) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(IconData(icon, fontFamily: 'MaterialIcons')),
          ),
          Text(title, style: TextStyle(fontSize: 20)),
        ],
      ),
      actions: [
        Visibility(
          visible: showActions,
          child: IconButton(
            icon: Icon(Icons.chat),
            color: Theme.of(context).colorScheme.onPrimary,
            onPressed: () {
              // Handle notification icon press
            },
          ),
        ),
        Visibility(
          visible: showActions,
          child: Padding(
            padding: EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.notifications),
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                // Handle notification icon press
              },
            ),
          ),
        ),
        Visibility(
          visible: showActions,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: UserActions(),
          ),
        ),
      ],
    );
  }
}
