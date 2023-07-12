export const tweet = (characters: string) => {
  if (characters.length > 501) {
    throw new Error('Our technology cannot support more than 240 characters.');
  }

  console.log(characters);
};
