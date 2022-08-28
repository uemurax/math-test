<section id="{{ page.slug }}">

{::nomarkdown}
  <header class="inline">
    <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
    {% include numbering.html clicks=page.clicks %}
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
    <span class='proof-list'>
      Proved at
      {% for proof in site.nodes | where: "taxon", "proof" %}
      {% if proof.of_proposition == page.slug %}
      {% include ref.html node=proof numbering=true slug=true %}
      {% endif %}
      {% endfor %}
    </span>
  </header>
{:/}
{{ content }}
</section>
