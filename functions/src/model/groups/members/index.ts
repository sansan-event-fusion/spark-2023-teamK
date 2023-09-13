export type MemberRole = "admin" | "member";

export type Member = {
  memberId: string;
  name: string;
  role: MemberRole;
  icon: string;
  description: string;
  createdAt: string; // date
  updatedAt: string; // date
};
