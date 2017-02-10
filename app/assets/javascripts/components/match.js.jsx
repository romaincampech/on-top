var Match = React.createClass({
  getInitialState: function() {
    return {
      display_form: false
    };
  },

  handleToggleClick: function() {
    this.setState(prevState => ({
      display_form: !prevState.display_form
    }));
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
          key={this.props.match.id} />}
        </div>
      </div>
    );
  }
});
