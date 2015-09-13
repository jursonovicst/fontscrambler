# fontscrambler

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Publications - Howto cite](#publications)


##Overview

This tool was created to demonstrate a simple idea to mitigate mass digital surveillance and big data analytics by altering the character encoding process on such way, which remains compatible with major online and offline formats, but increases the costs of computer analysis by forcing algorithms to process visual information.

##Module Description

###Generate script

The generate script is written in python and uses the FontForge library to manipulate typefaces. The following arguments are accepted:

* -i FILENAME: Non-scrambled TrueType font file to be scrambled.
* --multiglyph: Assignes multiple glyphs to one character to avoid the frequency analysis attack. For demonstration purposes a 1:10 assignment were implemented, which has to be further randomized for effective protection.
* --shake FACTOR: Implements the glyph hash protection algorithm. All points of all glyphs are moved by a random distance, which is proportional to the FACTOR multiplied with the width/height of the glyph. Then any remaining overlap is removed.
* --components: Changes the number of points in the glyph to prevent prediction by components. This is done by calling the simplify function of FontForge after shaking, which reduces the number points in the glyph.
* --no-scramble: Disables the glyph scrambling function to allow testing features individual.
* --seed SEED: Sets the seed of the pseudo-random generator to SEED. This allows the recreation of specific scrambling tables.



###Scramble script

The scramble script encodes text from the standard input according to the scrambling table specified in the argument.



###gocr, ocrad, tesseract folders



##Usage

```bash
generate --SEED 2
```


##Publications


