<section id="{{ page.slug }}">

{::nomarkdown}

  <header>
    <h{{ page.depth | plus: 1 }}>
      {{ page.title }}
    </h{{ page.depth | plus: 1 }}>
  </header>

{:/}

  {{ content }}

</section>
