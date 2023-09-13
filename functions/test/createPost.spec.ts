import { expect } from 'chai';
import * as admin from 'firebase-admin';
import { createPost } from '../src/modules/createPost'
import { describe, it, after } from 'mocha';


const testData: { groupId: string, memberId: string, postId: string, createdAt: string } = {
  groupId: 'testGroupId',
  memberId: 'testMemberId',
  postId: 'testPostId',
  createdAt: 'testCreatedAt',
};

let response

describe('createPost', () => {
  it('should create a post and return success true', async () => {
    const context = { auth: { uid: 'testUserId' } }; 
    response = await createPost(testData, null);
    expect(response.success).to.be.true;
    expect(response.id).to.be.a('string');
  });

  after(async () => {
    // Clean up test data
    await admin.firestore()
      .collection('groups')
      .doc(testData.groupId)
      .collection('members')
      .doc(testData.memberId)
      .collection('posts')
      .doc(response.id)
      .delete();
  });
});
