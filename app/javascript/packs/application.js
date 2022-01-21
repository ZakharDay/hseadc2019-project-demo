document.addEventListener('DOMContentLoaded', () => {
  fetch('http://localhost:3000/posts.json')
    .then((response) => response.json())
    .then((data) => console.log(data))
})
