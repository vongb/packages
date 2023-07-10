import { tweet } from './tweet';

describe('twitter', () => {
  it('should work', () => {
    expect(tweet('Hello world')).toBeUndefined();
  });
});
