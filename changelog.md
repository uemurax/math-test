---
title: Recent changes
layout: default
---

Recent commits on nodes.

<dl>
{% for commit in site.data.git_log.commits %}
<dt>
{{ commit.date | date_to_string }}
<a href="https://github.com/uemurax/math-test/commit/{{ commit.sha }}">
<code>{{ commit.sha | truncate: 7, "" }}</code>
</a>
</dt>
<dd>
{{ commit.message }}
</dd>
{% endfor %}
</dl>
