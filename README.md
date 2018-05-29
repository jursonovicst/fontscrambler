# fontscrambler



#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Prerequisites](#prerequisites)
4. [Usage](#usage)
5. [Publication - Howto cite](#publication)



## Overview

This tool was created to demonstrate a simple idea to mitigate mass digital surveillance and big data analytics by altering the character encoding process on such way, which remains compatible with major online and offline formats, but increases the costs of computer analysis by forcing algorithms to process visual information.



## Module Description

#### `generate` script

The generate script is written in python and uses the FontForge library to manipulate typefaces. The following arguments are accepted:

* -i FILENAME: Non-scrambled TrueType font file to be scrambled.
* --multiglyph: Assignes multiple glyphs to one character to avoid the frequency analysis attack. For demonstration purposes a 1:10 assignment were implemented, which has to be further randomized for effective protection.
* --shake FACTOR: Implements the glyph hash protection algorithm. All points of all glyphs are moved by a random distance, which is proportional to the FACTOR multiplied with the width/height of the glyph. Then any remaining overlap is removed.
* --components: Changes the number of points in the glyph to prevent prediction by components. This is done by calling the simplify function of FontForge after shaking, which reduces the number points in the glyph.
* --no-scramble: Disables the glyph scrambling function to allow testing features individual.
* --seed SEED: Sets the seed of the pseudo-random generator to SEED. This allows the recreation of specific scrambling tables.



#### `scramble` script

The scramble script encodes text from the standard input according to the scrambling table specified in the argument.



#### `gocr`, `ocrad`, and `tesseract` folders

Folders to measure the decoding effort of popular OCR softwares. Just run the `runme_ascii` script for a single, specific test, or the `runme` script to run multiple tests with different shaking factors, DPI, and random seeds.



## Prerequisites

The generate script depends on the fontforge python library. There is a [known bug](https://github.com/fontforge/fontforge/issues/1710) in the 20120731 version, which may causes the scrambling to hang, therefore please make sure, that you obtain the latest version. This can be done on Ubuntu very simply:

```bash
sudo add-apt-repository ppa:fontforge/fontforge
sudo apt-get update
sudo apt-get install fontforge python-fontforge
```

The OCR scripts require the following packages:

```bash
sudo apt-get install wdiff imagemagick gocr ocrad tesseract-ocr gnuplot
```

You may use your favourite OS, hovewer I tested Ubuntu 14.10 and 15.04.



## Usage

To scramble the `Andika-R.ttf` font (and initialize the random generator with 12345) use:

```bash
./generate -i Andika-R.ttf --seed 12345
```

This will create the scrabled `Andika-0-12345.ttf` font:

![Image of Yaktocat](https://github.com/jursonovicst/fontscrambler/blob/master/doc/Andika-0-12345.jpg)

and the `Andika-0-12345.txt` scrambler table for text encoding:

```text
0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.
hHcQs9wqC.yYtjXfomTbIuFL5rO3UBnpaM6dDAGxiRJzgW4SP12e0vlZEkN78KV
```

To encode text for display with the scrambled `Andika-0-12345.ttf` font, use:

```bash
echo "My example sentence." |./scramble Andika-0-12345.txt
```

which creates the following scrambled text:

```text
P6 XMyFruX UXLBXLtXV
```

Use this text with the scrambled font to display surveilance and analytics safe messages:



#### HTML example

```html
<!DOCTYPE html>
<html><head>
<style> 
@font-face {
    font-family: myFirstFont;
    src: url(https://example.com/Andika-0-12345.ttf);
}
div {
    font-family: myFirstFont;
}
</style></head>
<body>
<div>P6 XMyFruX UXLBXLtXV</div>
</body></html>
```

#### LaTeX example

```tex
%!TEX program = xelatex

\documentclass{article}[12pt]
\usepackage{fontspec}

\newfontfamily\ScrambledFont[
  Path = ./,
  UprightFont = Andika-0-12345.ttf,
  ItalicFont = Andika-0-12345.ttf,
  BoldFont = Andika-0-12345.ttf,
  BoldItalicFont = Andika-0-12345.ttf
]{Andika-0-12345.ttf}

\begin{document}
\ScrambledFont{P6 XMyFruX UXLBXLtXV}
\end{document}
```

#### Other examples

 - Microsoft Word: https://github.com/jursonovicst/fontscrambler/blob/master/sample.docx
 - PDF: https://github.com/jursonovicst/fontscrambler/blob/master/sample.pdf


## Publication

You will find the detailed description and analysis of this methin in the following [unpublished paper](http://dx.doi.org/10.13140/RG.2.1.4509.8489):

Jursonovics, T. (2016). Fontscrambler -- an approach for digital privacy. Unpublished paper.
