import {
  createGroup as createGroupFn,
  createPost as createPostFn,
  deleteUser as deleteUserFn,
  deleteMember as deleteMemberFn,
  deleteGroup as deleteGroupFn,
  deletePost as deletePostFn,
  acceptInvitation as acceptInvitationFn,
  approveRequest as approveRequestFn,
  addAlbumPictures as addAlbumPicturesFn,
} from "./modules";

import { functions } from "./lib/firebase";

export const createGroup = functions
  .region("us-central1")
  .https.onCall(createGroupFn);

export const createPost = functions
  .region("us-central1")
  .https.onCall(createPostFn);

export const deleteUser = functions
  .region("us-central1")
  .https.onCall(deleteUserFn);

export const deletePost = functions
  .region("us-central1")
  .https.onCall(deletePostFn);

export const deleteMember = functions
  .region("us-central1")
  .https.onCall(deleteMemberFn);

export const deleteGroup = functions
  .region("us-central1")
  .https.onCall(deleteGroupFn);

export const acceptInvitation = functions
  .region("us-central1")
  .https.onCall(acceptInvitationFn);

export const approveRequest = functions
  .region("us-central1")
  .https.onCall(approveRequestFn);

export const addAlbumPictures = functions
  .region("us-central1")
  .https.onCall(addAlbumPicturesFn);
