<section id="{{ page.slug }}">
{::nomarkdown}
  <header class="inline">
    {% include ref.html node=page show_numbering=true %}
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
  </header>
{:/}
{{ content }}
</section>
