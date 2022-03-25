import React, { PureComponent } from 'react'
import ChatMessage from '../components/ChatMessage'
import TextareaForm from '../components/TextareaForm'
import { createConsumer } from '@rails/actioncable'

export default class ChatContainer extends PureComponent {
  constructor(props) {
    super(props)

    this.state = {
      messages: []
    }
  }

  componentDidMount() {
    const { chatUrl } = this.props

    fetch(chatUrl)
      .then((response) => response.json())
      .then((data) => {
        this.setState({
          messages: data.messages
        })
      })

    const consumer = createConsumer()
    const self = this

    consumer.subscriptions.create(
      { channel: 'ChatChannel' },
      {
        // connected() {
        //   console.log('connected')
        // },
        // disconnected() {
        //   console.log('disconnected')
        // },
        received(data) {
          const { currentUserId } = self.props

          if (currentUserId != data.userId) {
            const messages = [...self.state.messages]
            messages.push(data)
            self.setState({ messages })
          }

          // console.log('received', data)
        }
      }
    )
  }

  handleCreate = (text) => {
    const { currentUserId, sendMessageUrl } = this.props
    const data = { body: text }
    const messages = [...this.state.messages]

    messages.push({
      id: Math.random(),
      userId: currentUserId,
      text: text
    })

    this.setState({ messages })

    fetch(sendMessageUrl, {
      method: 'POST', // or 'PUT'
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
      .then((response) => response.json())
      .then((data) => {
        // console.log('Success:', data)
      })
      .catch((error) => {
        console.error('Error:', error)
      })
  }

  render() {
    const { messages } = this.state
    const { currentUserId } = this.props
    // console.log(messages)
    const messageElements = []

    messages.forEach((message, i) => {
      messageElements.push(
        <ChatMessage
          {...message}
          currentUserId={currentUserId}
          key={message.id}
        />
      )
    })

    return (
      <div className="ChatContainer">
        {messageElements}
        <TextareaForm buttonText="Send" handleCreate={this.handleCreate} />
      </div>
    )
  }
}
