var KnockoutRound = React.createClass({

  updateMatch: function() {
    console.log('shit');
  },

  render: function() {
    console.log(this.props.matches[0]);
    console.log(this.props.round);

    var round = this.props.round;
    var round_matches = [];

    {this.props.matches.map(function(match, j) {

        round_matches.push(<Match match={match} key={j} score_params={match.score_params} setMatch={this.updateMatch}/>);
      }
    )}

    return (
      <div>
      <h1> Shit </h1>
        {round_matches}
      </div>
    )
  }
})
