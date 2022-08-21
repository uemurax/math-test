{::nomarkdown}
<section id="{{ page.slug }}">
  <div class="collapsible">
    <header class="inline">
      <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
      <span class='genus'>{{ page.genus }}</span>
      (<a class="slug" href="{% link _nodes/{{ page.of_theorem }}.md %}">[{{ page.of_theorem }}]</a>)
      <button type="button" class="collapsible-button"></button>
    </header>
    <div class="collapsible-content">
{:/}
{{ content }}
{::nomarkdown}
    </div>
  </div>
</section>
{:/}
