---
layout: none
---


<style>
  .full-width-link {
    display: block; /* Makes the link fill its container */
    color: inherit; /* Optional: ensures the link uses the table's text color */
    text-decoration: none; /* Optional: removes underline from links */
    padding: 10px; /* Optional: adds some padding inside the link */
  }
</style>

<table border="1">
  {% assign filtered_pages = site.posts %}
  {% assign sorted_pages = filtered_pages | sort: 'date' | reverse %}
  {% for p in sorted_pages %}
  <tr>
    <td>
      <a href="{{ p.url | relative_url }}" class="full-width-link">
        {{ p.title }}
        {% assign words = p.content | strip_newlines | strip_html | split: '' %}
        {% if words.size > 100 %}
          {{ words | slice: 0, 100 | join: ' ' }}...
        {% else %}
          {{ words | join: ' ' }}
        {% endif %}
      </a>
    </td>
  </tr>
  {% endfor %}
</table>
