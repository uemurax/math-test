{::nomarkdown}
<section id="{{ page.slug }}">
  <div class="collapsible">
    <header class="inline">
      {% include ref.html node=page show_numbering=true %}
      <span class='genus'>
        {{ page.genus }} of
        {% include ref.html slug=page.of_proposition show_numbering=true show_genus=true -%}
      </span>
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
