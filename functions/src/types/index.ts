import { functions } from "../lib/firebase";

// http関数
export type HttpHandler<
  RequestData extends Record<string, any>,
  ResponseData extends Record<string, any>
> = (
  data: RequestData,
  context: functions.https.CallableContext
) => Promise<ResponseData>;

