import {
  createGroup as createGroupFn,
  deleteMember as deleteMemberFn,
  acceptInvitation as acceptInvitationFn,
} from "./modules";
import { functions } from "./lib/firebase";

export const createGroup = functions
  .region("us-central1")
  .https.onCall(createGroupFn);

export const deleteMember = functions
  .region("us-central1")
  .https.onCall(deleteMemberFn);

export const acceptInvitation = functions
  .region("us-central1")
  .https.onCall(acceptInvitationFn);
