import { getParity } from './getParity';

describe('getParity', () => {
  it('should return "odd" when number is odd', () => {
    expect(getParity(1)).toEqual('odd');
  });
  it('should return "even" when number is even', () => {
    expect(getParity(2)).toEqual('even');
  });
});
