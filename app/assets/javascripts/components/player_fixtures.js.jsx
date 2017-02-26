var PlayerFixtures = React.createClass({
  getInitialState: function(){
    return {
      match: this.props.match
    };
  },

  handleScoreSubmit: function(data){
    this.setState({match: data});
  },

  render: function() {
    var player_matches = [];
    var player = this.props.player;

    {this.props.fixtures.map(function(match, j){
      if (match.player_one.id === player.id || match.player_two.id === player.id) {
          player_matches.push(<Match match={this.state.match} key={j} score_params={match.score_params} onScoreSubmit={this.handleScoreSubmit} />);
      }
    }.bind(this))}

    return (
      <div className="fixtures hidden" id={player.first_name}>
        {player_matches}
      </div>
    )
  }
})
