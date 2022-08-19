<section id="{{ page.slug }}">

{::nomarkdown}

  <header class="inline">
    <a class="slug" href="{{ page.url | relative_url }}">[{{ page.slug }}]</a>
    <span class='genus'>{{ page.genus }}</span>
    ({{ page.title }})
  </header>

{:/}

  {{ content }}

</section>
