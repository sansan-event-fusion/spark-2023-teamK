export type Post = {
  postId: string;
  memberId: string;
  description: string;
  imageUrlList: Record<string, string>;
  createdAt: string; // date
  updatedAt: string; // date
};
