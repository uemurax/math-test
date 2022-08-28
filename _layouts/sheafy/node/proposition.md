<section id="{{ page.slug }}">

{::nomarkdown}
  <header class="inline">
      {% include ref.html node=page show_numbering=true %}
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
    <span class='proof-list'>
      Proved at
      {% for proof in site.nodes | where: "taxon", "proof" %}
      {% if proof.of_proposition == page.slug %}
      {% include ref.html node=proof show_numbering=true %}
      {% endif %}
      {% endfor %}
    </span>
  </header>
{:/}
{{ content }}
</section>
