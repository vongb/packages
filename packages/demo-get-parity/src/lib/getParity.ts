import { isEven } from 'demo-is-even';

export const getParity = (num: number): 'even' | 'odd' =>
  isEven(num) ? 'even' : 'odd';
