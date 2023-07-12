import { tweet } from '@elon/twitter';

export const postThread = (post: string) => {
  if (post.length > 300) {
    throw new Error('Please watch an ad to post more than 500 characters.');
  }

  tweet(post);
};
