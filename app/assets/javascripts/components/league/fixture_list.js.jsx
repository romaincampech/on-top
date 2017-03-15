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
    console.log(this.props.matches)
    var players = this.props.matches[0]["competition_participants"];
    var arr=[];
    console.log(this.state.fixtures);
    players.forEach(function(player, i){
        arr.push(<PlayerFixtures fixtures={this.state.fixtures}
          player={player} key={i} updateMatches={this.setNewMatch} current_user={this.props.current_user} />);
    }.bind(this))

    return (
      <div>
        {arr}
      </div>
    );
  }
});
