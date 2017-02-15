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
    console.log('shit');
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
      dataType: 'json',
      data: {score_params: this.state.match.score_params}
    }).done(function(data) {
        this.setState({match: data});
        this.setState({match_complete: true});
      }.bind(this));
    this.setState({display_form: false});
  },

  render: function(){
    var display_form = this.state.display_form
    var match_complete = this.state.match_complete

    return (
      <div>
        {match_complete ? <FinalScore match={this.state.match}
            key={this.props.match.id}/> : <Fixture match={this.props.match}
            key={this.props.match.id} toggleClick={this.handleToggleClick} />}
        <div>
            {display_form && <ScoreForm match={this.props.match}
            key={this.props.match.id} onFormSubmit={this.handleFormSubmit}
            onUserInput={this.handleUserInput} />}
        </div>
      </div>
    );
  }
});
