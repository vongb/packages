import { tweet } from '@elon/twitter';

export const postThread = (post: string) => {
  if (post.length > 500) {
    throw new Error('Please watch an ad to post more than 500 characters.');
  }

  console.log('threddit');

  tweet(post);
};
