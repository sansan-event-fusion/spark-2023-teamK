import { createPost as createPostFn } from "./modules";

import {
  createGroup as createGroupFn,
  deleteMember as deleteMemberFn,
} from "./modules";

import { functions } from "./lib/firebase";

export const createGroup = functions
  .region("us-central1")
  .https.onCall(createGroupFn);

export const createPost = functions
  .region("us-central1")
  .https.onCall(createPostFn);

export const deleteMember = functions
  .region("us-central1")
  .https.onCall(deleteMemberFn);
