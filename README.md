# BIU Master Thesis Tex Template
A LaTeX template for a master thesis that follows the format required by Bar-Ilan University.
The relevant format is [BIU guidelines](https://graduate-school.biu.ac.il/node/1773).

This template saves you time on your LaTeX thesis by eliminating the need to search for obscure LaTeX commands to meet the university guidelines.

It is based on my own master thesis in mathematics, accepted in 2024.

## Disclaimer

This is not official nor affiliated with the university. 
This is just a little helper I wrote for my own master thesis in 2024. Use at your own peril.

# What this template includes

- The custom title page.
- The additional custom pages (advisors, acknowledgment).
- The hebrew cover pages (the hebrew title page, advisors, acknowledgment) in the end.
- Correctly handle page numbering: which pages are not numbered, which use roman style, which use hebrew letter numbering.
- Correctly handle what goes into the table of contents: The guideline requirements do not correspond to the `documentclass article` defaults. 

# What this template does NOT include

- The content of your thesis.
- Any other sections from the universtiy guideline (tables, acronyms, etc.).

# How to use

Place your content into the template, and just compile it!

Some remarks:
- Any hebrew text must be placed inside blocks `\begin{otherlanguage}{hebrew}` and `\end{otherlanguage}`.
- Sometimes, to achieve a single goal, we run several commands, so don't change the relative order of any command in the template.

## Alternative template with separate file for hebrew

The version `v0.9` used a different template in which all hebrew stuff was put in a spearate file, included as a pdf (this makes the main file single-lingual). This is nicer ergonomically, but note that there is a bug in this old version: if your hebrew abstract is spread across multiple pages, their page numbers may be incorrect. This is fixed in `v1.0.0`, but we replaced `babel` with `polyglossia` for the handling, which made backporting the fix to `v0.9` harder.

# Requirements

To compile the hebrew file, your LaTeX installation needs to handle hebrew. XeTex works with the right fonts installed.
We recommend to install "Lyx with hebrew" using this [Math-Wiki guide](https://math-wiki.com/index.php/%D7%94%D7%95%D7%A8%D7%90%D7%95%D7%AA_%D7%9C%D7%94%D7%AA%D7%A7%D7%A0%D7%AA_LyX). This includes the XeTex compiler.

## Dependencies
We use four LaTeX packages: `polyglossia` (for hebrew), `fontspec` and `setspace` (to control fonts and line width), and `hyperref` (to control the TOC).

# Documentation

- The hebrew part is handled using polyglossia. The document is multi-lingual, with main language set to English. Hebrew blocks are wrapped in `\begin{otherlanguage}{hebrew}`, `\end{otherlanguage}` blocks.
- The custom pages (the title, advisors, acknowledgments) is using `\titlepage` and hardcoding the format using the `\vfill, \hfill` and its family of manual spacing commands.
- In order to add the abstract and the bibliography into the Table of Contents, we used the `\phantomsection` command to create fake sections, combined with `\addcontentsline`  to add them. Note we use the `\addcontentsline` provided by `hyperref` which contains more than just refs, but actual links and pdf bookmarks. Turning these off is controlled by the options of `usepackage` for hyperref.
- Handling page numbering style is handled via the command `\pagenumbering`, with a custom method for the hebrew page numbers.
- Hebrew page numbering: this is harder, as just setting the language to hebrew and calling  `\pagenumbering{alph}` won't work as the document language is English. Hence, we manually override `\thepage` and how we add the hebrew abstract to the TOC. The solution is adapted from community-contributed code on Stack Overflow (see the Third-Party Attributions section below for details) based on the answers to this [stack overflow question](https://tex.stackexchange.com/questions/303046/how-can-i-use-hebrew-page-numbering-for-a-few-pages-in-an-english-document). 

---

# License, Attributions & Compliance

### For You (The Student)
* **Your Content is Yours:** This template only governs the layout structure. You retain full, exclusive copyright over your actual thesis text, data, figures, and research.
* **No Citations Needed in Your Thesis:** You do **not** need to include any legal text, licenses, or attributions to this template inside your final PDF or printed thesis. 
* **Important Compliance Rule:** If you share or publish your raw LaTeX source files (e.g., in a public GitHub repository), **do not delete the code comment lines starting with `%` that contain Stack Overflow links**. Leaving those comments intact in your source code fulfills all legal requirements automatically.

### Repository Licensing
This repository features a mixed licensing setup to balance user freedom with legal requirements:

1. **Original Template Code:** All original structural code and documentation created for this repository is dedicated to the public domain under the [CC0 1.0 Universal (CC0 1.0) Public Domain Dedication](https://creativecommons.org/publicdomain/zero/1.0/). You can copy, modify, and distribute it without asking permission or giving credit.
2. **Third-Party Code (Stack Overflow):** Specific, isolated snippets used to solve complex LaTeX behaviors are adapted from Stack Overflow and remain under their native **Creative Commons Attribution-ShareAlike (CC-BY-SA)** licenses. 

#### Specific Code Attributions
* **Hebrew Page Numbering Logic:** The workarounds for forcing correct Hebrew page numbers, and their reference in the TOC are adapted and modified from answers provided on [this Stack LaTeX Thread](https://tex.stackexchange.com/questions/303046/how-can-i-use-hebrew-page-numbering-for-a-few-pages-in-an-english-document). 
  * The primary logic is licensed under **CC BY-SA 3.0** (contributed prior to May 2018).
  * Supporting modifications are licensed under **CC BY-SA 4.0** (contributed post-May 2018).
  Visual inline credit is preserved via comments inside the template's `.tex` source files.