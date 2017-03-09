var NewKnockout = React.createClass({
  getInitialState: function() {
    return {
      complete: false
    }
  },

  handleChange: function(e) {
    this.setState({complete: true})
  },

  render: function() {
    var complete = this.state.complete;
    var stepThree;

    if (complete === true) {
      stepThree = (
      <SelectPlayers competition={this.props.competition}
        friends={this.props.friends}/>
      )
    };

    return (
      <div>
        <label for="number-of-players">Choose # of players:</label>
        <select name={this.props.competition.number_of_players}
          id="number-of-players" onChange={this.handleChange} >
          <option value="">How many?</option>
          <option value="2">2</option>
          <option value="4">4</option>
          <option value="8">8</option>
          <option value="16">16</option>
        </select>
        <div>
          {stepThree}
        </div>
      </div>
    );
  }
})