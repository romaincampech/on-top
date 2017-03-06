var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
    }
  },


  setNewMatch: function(data) {
    console.log(data["matches"]);
    this.setState({fixtures: data["matches"]});
  },

  render: function() {
    var players = this.props.matches[0]["competition_participants"];
    var arr=[];

    players.forEach(function(player, i){
        arr.push(<PlayerFixtures fixtures={this.state.fixtures}
          player={player} key={i} updateMatches={this.setNewMatch} />);
    }.bind(this))

    return (
      <div>
        {arr}
      </div>
    );
  }
});
