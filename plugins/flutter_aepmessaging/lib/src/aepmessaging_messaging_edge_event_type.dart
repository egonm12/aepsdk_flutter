/// Copyright 2023 Adobe. All rights reserved.
/// This file is licensed to you under the Apache License, Version 2.0 (the "License");
/// you may not use this file except in compliance with the License. You may obtain a copy
/// of the License at http://www.apache.org/licenses/LICENSE-2.0
/// Unless required by applicable law or agreed to in writing, software distributed under
/// the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
/// OF ANY KIND, either express or implied. See the License for the specific language
/// governing permissions and limitations under the License.

enum MessagingEdgeEventType {
  IN_APP_DISMISS,
  IN_APP_INTERACT,
  IN_APP_TRIGGER,
  IN_APP_DISPLAY,
  PUSH_APPLICATION_OPENED,
  PUSH_CUSTOM_ACTION
}

extension AEPMessagingEdgeEventTypeExt on MessagingEdgeEventType {
  int get value {
    switch (this) {
      case MessagingEdgeEventType.IN_APP_DISMISS:
        return 0;
      case MessagingEdgeEventType.IN_APP_INTERACT:
        return 1;
      case MessagingEdgeEventType.IN_APP_TRIGGER:
        return 2;
      case MessagingEdgeEventType.IN_APP_DISPLAY:
        return 3;
      case MessagingEdgeEventType.PUSH_APPLICATION_OPENED:
        return 4;
      case MessagingEdgeEventType.PUSH_CUSTOM_ACTION:
        return 5;
      default:
        return 0;
    }
  }
}

extension AEPMessagingEdgeEventTypeValueExt on String {
  MessagingEdgeEventType get toMessagingEdgeEventType {
    switch (this) {
      case 'decisioning.propositionDismiss':
        return MessagingEdgeEventType.IN_APP_DISMISS;
      case 'decisioning.propositionInteract':
        return MessagingEdgeEventType.IN_APP_INTERACT;
      case 'decisioning.propositionTrigger':
        return MessagingEdgeEventType.IN_APP_TRIGGER;
      case 'decisioning.propositionDisplay':
        return MessagingEdgeEventType.IN_APP_DISPLAY;
      case 'pushTracking.applicationOpened':
        return MessagingEdgeEventType.PUSH_APPLICATION_OPENED;
      case 'pushTracking.customAction':
        return MessagingEdgeEventType.PUSH_CUSTOM_ACTION;
    }
    return MessagingEdgeEventType.IN_APP_DISMISS;
  }
}
