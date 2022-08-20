---
layout: home
katex:
  macros:
    "\\MyLocalMacro": "\\LaTeX"
---

**Welcome to `krater`!**

This is a template for the static website generator [Jekyll][jekyll-url].

Its purpose is setting up all the plumbing needed by a modern math-intensive website:

- client side rendering of ordinary LaTeX with [KaTeX][katex-url]
- server side rendering of **arbitrarily complex** LaTeX with [AnTeX][antex-url] via [`jekyll-antex`][jekyll-antex-url]
- a nice automatic deploy running on [GitHub Actions][gha-url] to host the website on [GitHub Pages][ghp-url].

You can get going in no time!
All details are in the [readme][readme-url].

[jekyll-url]: https://jekyllrb.com/
[katex-url]: https://katex.org/
[antex-url]: https://github.com/paolobrasolin/antex/
[jekyll-antex-url]: https://github.com/paolobrasolin/jekyll-antex/
[gha-url]: https://github.com/features/actions
[ghp-url]: https://pages.github.com/
[readme-url]: https://github.com/paolobrasolin/krater#readme

The remainder of this page is a demo.

A pretty formula:

$$ F([n]) = \coprod*{i=1}^n F([1]) = \coprod*{i=1}^n X = [n] \otimes X $$

A pretty diagram:

{% tex classes: [antex, display] %}
$
\begin{tikzcd}
A \arrow[r, "f"] \arrow[d, "f"'] &
B \arrow[d, "g"] \arrow[dl, "\mathrm{id}_{B}"{description}] \\
C \arrow[r, "g"'] &
D
\end{tikzcd}
\qquad
\begin{tikzcd}
\cat{A} \arrow[r, "f"] \arrow[d, "g \circ f"'] &
\cat{B} \arrow[d, "h \circ g"] \arrow[dl, "g"{description}] \\
\cat{B} \arrow[r, "h"'] &
\cat{C}
\end{tikzcd}
$
{% endtex %}

Experiments with [jekyll-sheafy](https://github.com/paolobrasolin/jekyll-sheafy).

{% for lecture in site.lectures %}
  <a href="{{ lecture.url | relative_url }}">{{ lecture.title }}</a>
{% endfor %}
