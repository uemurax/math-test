{% unless page.of_proposition %}
{{ "missing required field 'of_proposition' in a proof node" | error }}
{% endunless %}
{::nomarkdown}
{% if page.subroot == page %}
{% assign is_subroot = true %}
{% else %}
{% assign is_subroot = false %}
{% endif %}
<section id="{{ page.slug }}">
  {% unless is_subroot %}<div class="collapsible">{% endunless %}
    <header class="inline">
      {{ page | node_ref }}
      <span class='genus'>
        {{ page.genus }} of
        {% node page.of_proposition | node_cref %}
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
