{::nomarkdown}
<section id="{{ page.slug }}">
  <div class="collapsible">
    <header class="inline">
      <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
      {% include numbering.html clicks=page.clicks %}
      <span class='genus'>{{ page.genus }}</span>
      {% capture link_prop -%}
      {% include ref.html slug=page.of_proposition numbering=true genus=true -%}
      {% endcapture -%}
      ({{ link_prop | strip }})
      <button type="button" class="collapsible-button">Show/Hide</button>
    </header>
    <div class="collapsible-content"
    style="display: {% if page.subroot == page %}block{% else %}none{% endif %};">
{:/}
{{ content }}
{::nomarkdown}
    </div>
  </div>
</section>
{:/}
