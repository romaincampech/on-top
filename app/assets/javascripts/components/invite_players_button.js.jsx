var InvitePlayersButton = React.createClass({
  getInitialState: function() {
    return {
      display_form: false
    }
  },

  handleClick: function(e){
    e.preventDefault();
    this.setState(prevState => ({
      display_form: !prevState.display_form
    }));
  },



  render: function() {
    var display_form = this.state.display_form;
    var selectedPlayers;

    if (display_form == true) {
      selectedPlayers = (
        <InvitePlayers friends={this.props.friends}
        competition={this.props.competition} />
      )
    }
    return (
      <div>
        <button onClick={this.handleClick}>Invite players</button>
        {selectedPlayers}
      </div>
    );
  }
});
