import 'package:intl/intl.dart';

// Chats enums (menu items for more)
enum ChatsMenuItems {
  newGroup,
  newBroadcast,
  linkedDevices,
  starredMessages,
  settings,
  switchAccounts
}

enum SingleChatMenuItems {
  viewContact,
  mediaLinksDocs,
  search,
  muteNotifications,
  disappearingMessages,
  wallpaper,
  report,
  block,
  clearChat,
  exportChat,
  addShortcut
}

// Status enums (menu items for more)
enum StatusMenuItems { statusPrivacy, createChannel, settings, switchAccounts }

// Communities enums (menu items for more)
enum CallsMenuItems { clearCallLog, settings, switchAccounts }

// Communities enums (menu items for more)
enum CommunitiesMenuItems { settings, switchAccounts }

enum SelectContactMenuItems { inviteAFriend, contacts, refresh, help }

/// datatime setting with respect to everywhere
String? setDateTime(DateTime datatime) {
  return DateFormat("HH:mm").format(datatime);
}
