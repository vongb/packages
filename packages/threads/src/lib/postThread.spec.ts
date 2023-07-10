import { postThread } from './postThread';

describe('threads', () => {
  it('should work', () => {
    expect(postThread('wow')).toBeUndefined();
  });
});
