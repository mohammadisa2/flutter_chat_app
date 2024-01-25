import 'package:flutter_chat_app/utils/utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

const oneSignalAppId = "228d973c-951d-4a5c-92e6-b93a7b70c08c";

Future<void> initOneSignal() async {
  final oneSignalShared = OneSignal.shared;

  // Set log level
  oneSignalShared.setLogLevel(OSLogLevel.none, OSLogLevel.none);

  // Set user privacy consent
  oneSignalShared.setRequiresUserPrivacyConsent(true);

  try {
    await oneSignalShared.setAppId(oneSignalAppId);
    vLog("OneSignal initialization successful");
  } catch (error) {
    vLog("Error initializing OneSignal: $error");
  }
}

void registerOneSignalEventListener({
  required Function(OSNotificationOpenedResult) onOpened,
  required Function(OSNotificationReceivedEvent) onReceivedInForeground,
}) {
  final oneSignalShared = OneSignal.shared;

  // Set notification opened handler
  oneSignalShared.setNotificationOpenedHandler(onOpened);

  // Set notification received handler for foreground
  oneSignalShared.setNotificationWillShowInForegroundHandler(
    onReceivedInForeground,
  );
}

const tagName = "userId";

void sendUserTag(int userId) {
  OneSignal.shared.sendTag(tagName, userId.toString()).then((response) {
    vLog("Successfully sent tags with response: $response");
  }).catchError((error) {
    vLog("Error sending tags: $error");
  });
}

void deleteUserTag() {
  OneSignal.shared.deleteTag(tagName).then((response) {
    vLog("Successfully deleted tags with response $response");
  }).catchError((error) {
    vLog("Error deleting tag: $error");
  });
}
