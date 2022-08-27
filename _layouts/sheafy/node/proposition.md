<section id="{{ page.slug }}">

{::nomarkdown}
  <header class="inline">
    <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
    <span class='proof-list'>
      Proved at
      {% for proof in site.nodes | where: "taxon", "proof" %}
      {% if proof.of_proposition == page.slug %}
      <a class="slug" href="{{ proof.url | relative_url }}">[{{ proof.slug }}]</a>
      {% endif %}
      {% endfor %}
    </span>
  </header>
{:/}
{{ content }}
</section>
