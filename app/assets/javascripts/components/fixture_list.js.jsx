var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
    }
  },

  setNewMatch: function(data) {
    console.log(data);
    this.setState({fixtures: data});
  },

  render: function() {
    var that = this
    var players = this.props.matches[0]["competition_participants"];
    var arr=[];
    console.log(players);
    players.forEach(function(player, i){
        arr.push(<PlayerFixtures fixtures={that.props.matches}
          player={player} key={i} updateMatches={this.setNewMatch} />);
    }.bind(this))

    return (
      <div>
        {arr}
      </div>
    );
  }
});
