var Match = React.createClass({
  getInitialState: function() {
    return {
      match: this.props.match,
      display_form: false,
      score_params: {}
    };
  },

  handleToggleClick: function() {
    this.setState(prevState => ({
      display_form: !prevState.display_form
    }));
  },

  onMatchUpdate: function(data) {
    this.props.matchUpdate(data);
  },

  onComplete: function(data) {
    var next;
    if (this.props.match.competition.category === "League") {
      next = (
        this.props.setMatch(data))
    }
  },

  handleUserInput: function(name, points) {
    var score = this.state.score_params;
    score[name] = points;
    this.setState({score_params: score});
    this.props.match.score_params = this.state.score_params;
  },

  handleFormSubmit: function() {
    this.setState({display_form: false});
    if (this.props.match.competition.category === "League") {
      $.ajax({
        type: 'PATCH',
        url: '/matches/' + this.props.match.id,
        dataType: 'json',
        data: {score_params: this.props.match.score_params}
      }).done(function(data) {
          this.props.setMatch(data);
        }.bind(this));
    } else {
      $.ajax({
        type: 'PATCH',
        url: '/matches/' + this.props.match.id,
        dataType: 'json',
        data: {score_params: this.props.match.score_params}
      }).done(function() {
        location.reload();
      })
    }
  },

  render: function(){
    var display_form = this.state.display_form
    var match_display;
    console.log(this.props)

    if (this.props.match.status === 'Played') {
      match_display = (
        <FinalScore match={this.props.match}
        key={'finalscore' + this.props.match.id}
          toggleClick={this.handleToggleClick}/>
      )
    } else {
      match_display = (
        <Fixture match={this.props.match}
        key={this.props.match.id} toggleClick={this.handleToggleClick} />
      )
    }

    return (
      <div>
        <div>
          { match_display }
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
