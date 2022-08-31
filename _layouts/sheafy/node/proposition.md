<section id="{{ page.slug }}">

{::nomarkdown}
  <header class="inline">
    {{ page | node_ref }}
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
    <span class='proof-list'>
      Proved at
      {% for proof in site.nodes | where: "taxon", "proof" %}
      {% if proof.of_proposition == page.slug %}
      {{ proof | node_ref }}
      {% endif %}
      {% endfor %}
    </span>
  </header>
{:/}
{{ content }}
</section>
