var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
    }
  },

  render: function() {
    var players =
    return (
      <div>
        for(i = 0; i < players.length; i++ ) {
            <div id={players[i].first_name}>
        {this.props.matches.map(function(match){

            if (match.player_one.id === match.competition_participants[i].id || match.player_two.id ===match.competition_participants[i].id) {
            return <Match match={match} key={match.id} score_params={match.score_params} />;
            }

          }

        )}
             </div>
      }
      </div>
    );
  }
});
