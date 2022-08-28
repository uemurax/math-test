{::nomarkdown}
<section id="{{ page.slug }}">
  <div class="collapsible">
    <header class="inline">
      <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
      <span class='genus'>{{ page.genus }}</span>
      (<a class="slug" href="{% link _nodes/{{ page.of_proposition }}.md %}">[{{ page.of_proposition }}]</a>)
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
