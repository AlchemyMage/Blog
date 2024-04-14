---
layout: base
---

<div id="randomPostsContainer"></div> <!-- Ensure this exists in your HTML -->

<script>
document.addEventListener('DOMContentLoaded', function() {
    fetch('/Blog/list')
        .then(response => response.text())
        .then(html => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');

            // Extract all links into an array
            const links = Array.from(doc.querySelectorAll('a.full-width-link'));
            
            // Function to pick random items from an array
            function pickRandomItems(arr, num) {
                const shuffled = arr.sort(() => 0.5 - Math.random());
                return shuffled.slice(0, num);
            }

            // Pick 5 random links
            const randomLinks = pickRandomItems(links, 5);

            // Display these links in the page
            const container = document.getElementById('randomPostsContainer');
            randomLinks.forEach(link => {
                const div = document.createElement('div');
                div.innerHTML = link.outerHTML; // Assuming you want to keep the entire HTML of the link
                container.appendChild(div);
            });
        })
        .catch(error => {
            console.error('Error fetching or processing the data:', error);
        });
});
</script>