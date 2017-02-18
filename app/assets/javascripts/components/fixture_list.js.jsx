var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
    }
  },

  render: function() {
    var players = this.props.matches[0]["competition_participants"];


    for (i=0; i < players.length; i++) {
      var arr = [];
      var player_matches = [];
      <div id={players[i].first_name}>
        {this.props.matches.map(function(match){
          if (match.player_one.id === match.competition_participants[i].id || match.player_two.id === match.competition_participants[i].id) {
            arr.push(<Match match={match} key={match.id} score_params={match.score_params} />);
          }
        })}
      </div>
    }

    console.log(players[0].first_name);
    console.log(arr)
    return (
      <div>

       {arr}

      </div>
    );
  }
});
