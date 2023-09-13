import {
  createGroup as createGroupFn,
  deleteMember as deleteMemberFn,
  acceptInvitation as acceptInvitationFn,
  approveRequest as approveRequestFn,
} from "./modules";
import { createPost as createPostFn } from "./modules";
import { deleteGroup as deleteGroupFn } from "./modules";

import { functions } from "./lib/firebase";

export const createGroup = functions
  .region("us-central1")
  .https.onCall(createGroupFn);

export const deleteMember = functions
  .region("us-central1")
  .https.onCall(deleteMemberFn);

export const createPost = functions
  .region("us-central1")
  .https.onCall(createPostFn);

export const deleteGroup = functions
  .region("us-central1")
  .https.onCall(deleteGroupFn);

export const acceptInvitation = functions
  .region("us-central1")
  .https.onCall(acceptInvitationFn);

export const approveRequest = functions
  .region("us-central1")
  .https.onCall(approveRequestFn);

