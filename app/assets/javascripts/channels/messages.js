$(document).ready(function() {

// this code makes it so it load the chat at the bottom of the page
  if ($('#messages').length > 0) {
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }



// this code is for the ActionCable
  App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
      return $('#messages ul').append(this.renderMessage(data)),
// scrolling to bottom of page with every message render
      $('#messages').scrollTop($('#messages')[0].scrollHeight)
    },
// how the message displays
    renderMessage: function(data) {
      return "<li><div class='message'> \
      <div class='message-block'> \
        <div class='message-user'> \
           <span class='text-muted'>"
             + data.user +
             "<br>"
             + data.time +
             "</span><br>"
             +
          "</p> \
        </div> \
        <div class='message-bubble'><p>"
          + data.body +
          "</p> \
        </div> \
      </div>\
      </div></li> ";
    }
  });

});
