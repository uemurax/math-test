<section id="{{ page.slug }}">
{::nomarkdown}
  <header class="inline">
    {{ page | node_ref }}
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
  </header>
{:/}
{{ content }}
</section>
