import { createPost as createPostFn } from "./modules";
import { deletePost as deletePostFn } from "./modules";

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

export const deletePost = functions
  .region("us-central1")
  .https.onCall(deletePostFn);

export const deleteMember = functions
  .region("us-central1")
  .https.onCall(deleteMemberFn);
