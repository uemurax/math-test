{::nomarkdown}
{% if page.subroot == page %}
{% assign is_subroot = true %}
{% else %}
{% assign is_subroot = false %}
{% endif %}
<section id="{{ page.slug }}">
  {% unless is_subroot %}<div class="collapsible">{% endunless %}
    <header class="inline">
      {% include ref.html node=page show_numbering=true %}
      <span class='genus'>
        {{ page.genus }} of
        {% include ref.html slug=page.of_proposition show_numbering=true show_genus=true -%}
      </span>
      {% unless is_subroot %}<button type="button" class="collapsible-button">Show/Hide</button>{% endunless %}
    </header>
    {% unless is_subroot %}<div class="collapsible-content" style="display: none;">{% endunless %}
{:/}
{{ content }}
{::nomarkdown}
    {% unless is_subroot %}</div>{% endunless %}
  {% unless is_subroot %}</div>{% endunless %}
</section>
{:/}
