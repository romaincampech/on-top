var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
    }
  },

  updateMatches: function() {
    this.setState({matches: data});
  },

  render: function() {
    var that = this
    var players = this.props.matches[0]["competition_participants"];
    var arr=[];
    console.log(players);
    players.forEach(function(player, i){
        arr.push(<PlayerFixtures fixtures={that.props.matches}
          player={player} key={i} updateMatch={this.updateMatches} />);
    })

    return (
      <div>
        {arr}
      </div>
    );
  }
});
