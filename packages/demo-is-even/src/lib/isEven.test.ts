import { isEven } from './isEven';

describe('isEven', () => {
  it('should return false if odd', () => {
    expect(isEven(1)).toEqual(false);
  });
  it('should return true if even', () => {
    expect(isEven(2)).toEqual(true);
  });
});
