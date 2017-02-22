var Fixture = React.createClass({
  handleClick: function(e){
    e.preventDefault();
    this.props.toggleClick();
  },

  render: function(){
    return(
      <div className="match-league" id={this.props.match.match_number}>
        <div>
          {this.props.match.player_one.first_name}
        </div>
        <span>vs</span>
        <div>
          {this.props.match.player_two.first_name}
        </div>
        <div id={this.props.match.match_number}>
          <button className="league-result-input-btn"
            onClick={this.handleClick} >Enter Score</button>
        </div>
      </div>
    );
  }
})
