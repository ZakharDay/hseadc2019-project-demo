import React from 'react'
import ReactDOM from 'react-dom'
import ChatContainer from '../containers/ChatContainer'
import { ActionCableProvider } from '@thrash-industries/react-actioncable-provider'

document.addEventListener('DOMContentLoaded', () => {
  const chatWrapper = document.getElementById('chatWrapper')
  const props = JSON.parse(chatWrapper.dataset.props)

  if (chatWrapper) {
    ReactDOM.render(
      <ActionCableProvider url="ws://localhost:3000/cable">
        <ChatContainer {...props} />
      </ActionCableProvider>,
      chatWrapper
    )
  }
})
