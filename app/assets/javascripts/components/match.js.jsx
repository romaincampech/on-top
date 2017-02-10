var Match = React.createClass({
  getInitialState: function() {
    return {
      display_form: false,
      match_complete: false,
      score_params: {}
    };
  },

  handleToggleClick: function() {
    this.setState(prevState => ({
      display_form: !prevState.display_form
    }));
  },

  handleUserInput: function(name, points) {
    var score = this.state.score_params;
    score[name] = points;
    this.setState({score_params: score});
  },

  handleFormSubmit: function(score_params) {
   var match = {id: this.props.match.id, score_params: this.state.score_params};
   $.ajax({
    type: 'PATCH',
    url: Routes.match_path(match)
    });
  },

  render: function(){
    var display_form = this.state.display_form

    return (
      <div className="match-league" id={this.props.match.match_number}>
        <div>
          {this.props.match.player_one.first_name}
        </div>
        <span>vs</span>
        <div>
          {this.props.match.player_two.first_name}
        </div>
        <div id={this.props.match.match_number}>
          <button onClick={this.handleToggleClick} >Enter Score</button>
        </div>
        <div>
          {display_form && <ScoreForm match={this.props.match}
          key={this.props.match.id} onFormSubmit={this.handleFormSubmit}
          onUserInput={this.handleUserInput} />}
        </div>
      </div>
    );
  }
});
