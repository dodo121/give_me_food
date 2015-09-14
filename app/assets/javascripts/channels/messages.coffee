App.messages = App.cable.subscriptions.create 'MessagesChannel',
  console.log('create');
  received: (data) ->
    console.log(data);
    $('#messages').append @renderMessage(data)

  renderMessage: (data) ->
    "<p><b>[#{data.username}]:</b> #{data.message}</p>"