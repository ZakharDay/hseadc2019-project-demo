import classnames from 'classnames'
import React, { PureComponent } from 'react'

export default class ChatMessage extends PureComponent {
  constructor(props) {
    super(props)
  }

  render() {
    const { text, userName, userId, currentUserId } = this.props

    const classes = classnames({
      ChatMessage: true,
      currentUser: userId === currentUserId
    })

    return (
      <div className={classes}>
        <div className="name">{userName}</div>
        <div className="message">{text}</div>
      </div>
    )
  }
}
