import consumer from 'channels/consumer'

consumer.subscriptions.create(
  { channel: 'ChatChannel' },
  {
    connected() {
      // Called when the subscription is ready for use on the server
      console.log('connected')
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
      console.log('disconnected')
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      console.log('received', data)
    }
  }
)

document.addEventListener('DOMContentLoaded', () => {
  const button = document.getElementById('testWebsocket')
  button.addEventListener('click', () => {
    fetch('http://localhost:3000/chats/test')
      .then((response) => response.json())
      .then((data) => console.log(data))
  })
})

// consumer.subscriptions.create(
//   { channel: 'ChatChannel' },
//   {
//     received(data) {
//       this.appendLine(data)
//     },
//
//     appendLine(data) {
//       const html = this.createLine(data)
//       const element = document.querySelector("[data-chat-room='Best Room']")
//       element.insertAdjacentHTML('beforeend', html)
//     },
//
//     createLine(data) {
//       return `
//       <article class="chat-line">
//         <span class="speaker">${data}</span>
//       </article>
//     `
//     }
//   }
// )
