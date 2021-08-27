# Gilded Rose Refactoring Kata

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a
prominent city ran by a friendly innkeeper named Allison. We also buy and sell only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures.

Your task is to add the new feature to our system so that
we can begin selling a new category of items.

First, an introduction to our system:

- All items have a `SellIn` value which denotes the number of days we have to sell the item
- All items have a `Quality` value which denotes how valuable the item is
- At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

- Once the sell by date has passed, `Quality` degrades twice as fast
- The `Quality` of an item is never negative
- "Aged Brie" actually increases in Quality the older it gets
- The `Quality` of an item is never more than 50
- "Sulfuras", being a legendary item, never has to be sold or decreases in `Quality`
- "Backstage passes", like aged brie, increases in `Quality` as its SellIn value approaches;
  `Quality` increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
  `Quality` drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

- "Conjured" items degrade in `Quality` twice as fast as normal items

Feel free to make any changes to the `UpdateQuality` method and add any new code as long as everything
still works correctly. **However, do not alter the `Item` class or `Items` property** as those belong to the
goblin in the corner who will insta-rage and one-shot you as he doesn't believe in shared code
ownership (you can make the `UpdateQuality` method and Items property static if you like, we'll cover
for you).

Just for clarification, an item can never have its `Quality` increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.

## How to use this Kata

You can do this exercise in either Ruby or Typescript.

The simplest way is to just clone the code and start hacking away improving the design. You'll want to carefully read the above requirements. I strongly advise you that you'll also need some tests if you want to make sure you don't break the code while you refactor.

### Discussion prompts

1. Is there anything you don't you like about this code? Why?
2. What steps could we take to refactor this code so we can improve it? Think about if any of these are general principles that might apply to any refactoring.
3. What tests could you add to help you confidently change this code? (Both the Ruby and Typescript versions come with a failing test to get you started.)

Whichever testing approach you choose, the idea of the exercise is to do some deliberate practice, and improve your skills at designing test cases and refactoring. The idea is not to re-write the code from scratch, but rather to practice designing tests, taking small steps, running the tests often, and incrementally improving the design.

This Kata is forked from [Emily Bache's version](https://github.com/emilybache/GildedRose-Refactoring-Kata) which has many more languages available besides Ruby and Typescript.

### Sharing your code

When you are done with the exercise, commit your code to a new branch and push it up to the repo. We'll compare approaches at the end of the workshop.

## Requirements in other languages

- [Español](GildedRoseRequirements_es.md)
- [Français](GildedRoseRequirements_fr.md)
- [日本語](GildedRoseRequirements_jp.md)
- [Português](GildedRoseRequirements_pt-BR.md)
- [Русский](GildedRoseRequirements_ru.txt)
- [ไทย](GildedRoseRequirements_th.md)
- [中文](GildedRoseRequirements_zh.txt)
- [한국어](GildedRoseRequirements_kr.md)
