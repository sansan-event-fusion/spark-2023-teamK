import {
  createGroup as createGroupFn,
  deleteMember as deleteMemberFn,
  acceptInvitation as acceptInvitationFn,
  approveRequest as approveRequestFn,
  addAlbumPictures as addAlbumPicturesFn,
  removeAlbumPicture as removeAlbumPictureFn,
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

export const approveRequest = functions
  .region("us-central1")
  .https.onCall(approveRequestFn);

export const addAlbumPictures = functions
  .region("us-central1")
  .https.onCall(addAlbumPicturesFn);

export const removeAlbumPicture = functions
  .region("us-central1")
  .https.onCall(removeAlbumPictureFn);
