var Match = React.createClass({
  getInitialState: function() {
    return {
      match: this.props.match,
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
    console.log(score);
    this.setState({score_params: score});
    this.state.match.score_params = this.state.score_params;
  },

  handleFormSubmit: function() {
    console.log(this.state.match);
    $.ajax({
      type: 'PATCH',
      url: '/matches/' + this.props.match.id,
      data: {score_params: this.state.match.score_params},
      success: function() {
        console.log('you did it!!!');
      }
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
