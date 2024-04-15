---
layout: none
---


<table border="1">
  {% assign filtered_pages = site.posts %}
  {% assign sorted_pages = filtered_pages | sort: 'date' | reverse %}
  {% for p in sorted_pages %}
  <tr>
    <td>
      <a style="font-size: 1.3em;" href="{{ p.url | relative_url }}" class="full-width-link">
        {{ p.title }}
      </a>
      {% assign words = p.content | strip_newlines | strip_html | split: '' %}
      {% if words.size > 100 %}
        {{ words | slice: 0, 100 | join: ' ' }}...
      {% else %}
        {{ words | join: ' ' }}
      {% endif %}
      
    </td>
  </tr>
  {% endfor %}
</table>
