import { createGroup as createGroupFn } from "./modules";
import { functions } from "./lib/firebase";

export const createGroup = functions
  .region("us-central1")
  .https.onCall(createGroupFn);
