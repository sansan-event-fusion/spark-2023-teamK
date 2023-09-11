import { HttpHandler } from "../types";

type RequestData = {
  userId: string;
};

type ResponseData = {
  message: string;
};

export const createGroup: HttpHandler<RequestData, ResponseData> = (
  data,
  _
) => {
  return {
    message: data.userId,
  };
};
