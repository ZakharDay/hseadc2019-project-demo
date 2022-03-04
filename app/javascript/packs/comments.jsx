import React from 'react'
import ReactDOM from 'react-dom'
import CommentsContainer from '../containers/CommentsContainer'

document.addEventListener('DOMContentLoaded', () => {
  const postCommentsElement = document.getElementById('postComments')
  const props = JSON.parse(postCommentsElement.dataset.props)
  console.log('yo')
  if (postCommentsElement) {
    ReactDOM.render(
      <CommentsContainer {...props} />,
      document.getElementById('postComments')
    )
  }
})
