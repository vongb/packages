export const tweet = (characters: string) => {
  if (characters.length > 240) {
    throw new Error('Our technology cannot support more than 240 characters.');
  }

  console.log(characters);
};
