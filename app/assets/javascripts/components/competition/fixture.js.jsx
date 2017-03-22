var Fixture = React.createClass({
  handleClick: function(e){
    e.preventDefault();
    this.props.toggleClick();
  },

  render: function(){

    return(
      <div className="match-league" id={this.props.match.match_number}>
        <div className="versus">
          <div className="player">
            {this.props.match.player_one.first_name}
          </div>
          <span>vs</span>
          <div className="player">
            {this.props.match.player_two.first_name}
          </div>
        </div>
        <div id={this.props.match.match_number}>
          <button className="btn league-result-input-btn"
            onClick={this.handleClick} >Enter Score</button>
        </div>
      </div>
    );
  }
})
