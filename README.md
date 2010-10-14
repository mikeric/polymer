# polymer

A [Sinatra](http://www.sinatrarb.com/) application for visualizing [polyrhythmic compositions](http://en.wikipedia.org/wiki/Polyrhythm) in ASCII musical measures. [Try it out](http://polymer.heroku.com).

## Abstract

I wrote polymer as a way to get polyrhythmic concepts into readable notation quickly and easily, by providing any number of patterns and having them automatically mapped into measures. This is achieved by finding a common denominator between each of the patterns (the polyrhythm's resolve point) and multiplying them in a 3 dimensional array. The contents of this array are rendered with bars being illustrated with "|" and every downbeat in **bold**.

Each pattern consists of a timing, a body and a resolution which defaults to 16. The timing corresponds to the second number in the time signature 7/**8** and spans x characters where *x = resolution / timing*. The first number in the time signature **7**/8 will be figured out interactively using *length / x*.

Consider the following pattern `x-o-x-o-x-o-o-`. If each character represents a 16th note, this could be interpreted as 7/8 (7 eighth notes) or 14/16 (14 sixteenth notes) depending on the specified timing of the pattern. However, since the pattern cannot divide evenly into quarter, half, or whole notes, specifying 4, 2, or 1 as the timing would result in an invalid pattern.

A polyrhythm contains 2 or more of these patterns and will multiply each of them until they meet at the resolve point. For example, we have a 1/4, 7/16 polyrhythm.

     1/4   x---
     7/16  o-o-o--

In order to play these patterns simultaneously, it's easier if you can see a full revolution of the rhythm. Since both of these patterns resolve at 28 sixteenths, we can show that it takes *(7 * 1)/4* (7 quarters) and *(4 * 7)/16* (28 sixteenths) for them to meet at the resolve point.

           1   2   3   4   5   6   7
           |   |   |   |   |   |   |
     1/4   x---x---x---x---x---x---x---
     7/16  o-o-o--o-o-o--o-o-o--o-o-o--
           |      |      |      |
           1      2      3      4

To illustrate where each bar starts, we always base this on the first pattern and inject a "|" every x characters where *x = 4* in this case.

     1/4   |x---|x---|x---|x---|x---|x---|x---
     7/16  |o-o-|o--o|-o-o|--o-|o-o-|-o-o|-o--

This makes for a readable bar of music, which you can extend simply by introducing any number of new patterns, timings, and resolutions to the polyrhythm.