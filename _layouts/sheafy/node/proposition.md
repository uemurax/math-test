<section id="{{ page.slug }}">

{::nomarkdown}
  <header class="inline">
    {% include result-header.html page=page %}
    {% capture proofs -%}
    {% for proof in site.nodes | where: "taxon", "proof" -%}
    {% if proof.of_proposition == page.slug -%}
    {{ proof | node_ref }}
    {% endif -%}
    {% endfor -%}
    {% endcapture -%}
    {% if proofs != "" %}
    <span class='proof-list'>
      Proved at {{ proofs }}
    </span>
    {% else %}
    <span class='not-proved'>
      NOT PROVED
    </span>
    {% endif %}
  </header>
{:/}
{{ content }}
</section>
