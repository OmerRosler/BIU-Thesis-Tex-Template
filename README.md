# BIU-Thesis-Tex-Template
A latex template to create a master thesis following the guidelines of BIU.
Use this to save time on searching obscure latex commands to make your LaTeX written thesis follow the [BIU guidelines](https://graduate-school.biu.ac.il/node/1773).

This template is based on my own master thesis in mathematics, accepted in 2024.

# What this template includes

1. Handling the title page (in hebrew and english).
2. The "this was done for a master thesis" page.
3. Acknowledgement page.
4. Correctly handling page numbering (what should be numbered, what should not, what should be numbered in roman/hebrew).
5. Correctly handle what goes and what doesn't go into the table of contents. For example, the guidelinee suggests the abstract goes in, unlike the default in latex (with documentclass article).


# What this template does NOT include
1. The content of your thesis.
2. Any other sections from the guideline (tables, acronyms, etc.).

# How to use
1. First compile the `hebrew_asbtract.tex` file into a pdf.
2. Within the `thesis_template.tex` file, update the `\LastAbstractPage` variable to the last page number of the hebew abstract. This is the last page whose numbering will be hebrew alphabetic numbers.
3. Compile the `thesis_template.tex` file.

# How it works

TODO

# Disclaimer

This is not official nor affiliated with the university. 
This is just a helper I wrote for my own master thesis in 2024. Use at your own risk.