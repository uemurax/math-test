{% if page.subroot == page %}
<section id="{{ page.slug }}">
{::nomarkdown}
  <header>
    <h{{ page.depth | plus: 1 }}>
      {{ page.title }}
    </h{{ page.depth | plus: 1 }}>
  </header>
{:/}
{{ content }}
{::nomarkdown}
{% assign filtered_resources = page.children | where: "clicker", "section" %}
{% if filtered_resources.size != 0 %}
<nav>
  <h4>Structure</h4>
  {% include toc.html page=page %}
</nav>
{% endif %}
{:/}
</section>
{% else %}
{% endif %}
