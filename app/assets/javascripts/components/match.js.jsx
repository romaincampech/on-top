var Match = React.createClass({
  render: function(){
    return (
      <div className="match-league" id={this.props.match.match_number}>
        <div>
          {this.props.match.player_one.first_name}
        </div>
        <span>vs</span>
        <div>
          {this.props.match.player_two.first_name}
        </div>
        <div className="btn btn-sm league-result-input-btn" id={this.props.match.match_number}>
          Enter Score
        </div>
      </div>
    );
  }
});
