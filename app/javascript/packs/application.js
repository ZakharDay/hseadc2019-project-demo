document.addEventListener('DOMContentLoaded', () => {
  const props = document.getElementById('postsJSON').dataset.props
  const json = JSON.parse(props)
  console.log(props, json)
})
