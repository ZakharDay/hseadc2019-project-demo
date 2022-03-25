import React, { PureComponent } from 'react'

export default class TextareaForm extends PureComponent {
  constructor(props) {
    super(props)
    this.textarea = React.createRef()
  }

  handleSubmit = () => {
    const { handleCreate } = this.props
    const text = this.textarea.current.value

    if (text != '') {
      handleCreate(text)
      this.textarea.current.value = ''
    }
  }

  render() {
    const { buttonText } = this.props

    return (
      <div className="TextareaForm">
        <textarea ref={this.textarea} />

        <div className="submitButton" onClick={this.handleSubmit}>
          {buttonText}
        </div>
      </div>
    )
  }
}
