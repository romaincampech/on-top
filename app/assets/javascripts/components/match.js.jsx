var Match = React.createClass({
  render: function(){
    return (
      // <% if match.players.first == player || match.players.last == player %>
      <div className="match-league" id={this.props.match.match_number}>
      // <% if match.players.first %>
        // <%= link_to user_path(match.players.first), "data-toggle" => "tooltip", title: "#{match.players.first.full_name}" do %>
        <div className="avatar-div">
          <img src={this.props.match.player_one.photo}>
        </div>
        // <% end %>
        // <% end %>
        <span>vs</span>
        // <% if match.players.last != match.players.first %>
        // <%= link_to user_path(match.players.last), "data-toggle" => "tooltip", title: "#{match.players.last.full_name}" do %>
        <div className="avatar-div">
          <img src={this.props.match.player_two.photo}>
        </div>
        // <% end %>
        // <% end %>
        // <% if current_user == @competition.creator %>
        <div className="btn btn-sm league-result-input-btn", id={this.props.match.match_number}>
          Enter Score
        </div>
        // <% elsif current_user == match.players.first || current_user == match.players.last %>
        //   <div class="btn btn-sm league-result-input-btn", id=<%= "#{match.match_number}" %>>Enter Score</div>
        // <% else %>
        //   <p><em><%= match.status %></em></p>
        // <% end %>
      </div>
      <div className="score-form" id="edit-<%="#{match.match_number}" %>">
        <%= render 'matches/edit_two', match: match %>
      </div>

      )
  }})
