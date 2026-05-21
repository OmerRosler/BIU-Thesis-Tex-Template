# BIU Master Thesis Tex Template
A latex template for a master thesis that follows the format required by Bar-Ilan University.
The relevant format is [BIU guidelines](https://graduate-school.biu.ac.il/node/1773).

If your must follow the guidelines, and your thesis is written in latex, this template saves you time on searching for obscure latex commands.

It is based on my own master thesis in mathematics, accepted in 2024.

## Disclaimer

This is not official nor affiliated with the university. 
This is just a little helper I wrote for my own master thesis in 2024. Use at your own peril.

# What this template includes

- The custom title page.
- The additional custom pages (advisors, acknowledgmenet).
- The hebrew pages (title, advisors, acknowledgement) in the end.
- Correctly handle page numbering: which pages are not numered, which use roman style, which use hebrew letter numbering.
- Correctly handle what goes into the table of contents: The guideline requirements do not correspond to the `documentclass article` defaults. 

# What this template does NOT include

- The content of your thesis.
- Any other sections from the guideline (tables, acronyms, etc.).

# How to use

1. Put all the hebrew content (abstract, advisors, acknowledgements) into the `hebrew_abstract.tex` file.
2. Put the english content into the `thesis_template.tex` file, which should be the main file of the thesis.
3. Compile the `hebrew_asbtract.tex` file into a pdf.
4. Within the `thesis_template.tex` file, update the `\LastAbstractPage` variable to the page number of the last page of the hebrew abstract. The default is `1`. If you don't do this, only the first page of the abstract will be included.
5. Compile the `thesis_template.tex` file.


# Requirements

To compile the hebrew file, your latex installation needs to handle hebrew. XeTex works with the right fonts installed.
We recommend to install "Lyx with hebrew" using this [Math-Wiki guide](https://math-wiki.com/index.php/%D7%94%D7%95%D7%A8%D7%90%D7%95%D7%AA_%D7%9C%D7%94%D7%AA%D7%A7%D7%A0%D7%AA_LyX). This includes the XeTex compiler.

Once the hebrew pdf is created, any latex compiler works for the main thesis file.

## Dependencies
We use three latex packages: `babel` (for hebrew), `pdfpages` (to include a pdf into the tex file), and `hyperref` (to control the TOC).

# Documentation

- The hebrew part is handled as a two steps compilation: 
    1. compile a hebrew-only tex file into a pdf. 
    2. include it as a pdf in the end of the file, using the `includepdf` command.
- The custom pages (the title, the "part of thesis" page) is using `\titlepage` and hardcoding the format using the `\vfill, \hfill` and its family of manual spacing commands.
- In order to add the abstract and the bibliogrpahy into the Table of Contents, we used the `\phantomsection` command to create fake sections, combined with `\addcontentsline` (when required) to add them.
- Handling the weird page numbering is handled via the command `\pagenumbering`.
- Hebrew page numbering: because only the abstract has to be numbered (and not the "advisors" page nor the title), we call `includepdf` twice, once with humbering (and adding into TOC commands) and once without it.