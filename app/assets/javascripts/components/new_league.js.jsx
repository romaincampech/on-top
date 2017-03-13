var NewLeague = React.createClass({
  getInitialState: function() {
    return {
      complete: false
    }
  },

  handleChange: function(e) {
    this.setState({complete: true});
    this.props.handleNumberInput(e.target.value);
  },

  render: function() {
    var complete = this.state.complete;
    var stepThree;

    if (complete === true) {
      stepThree = (
      <SelectPlayers competition={this.props.competition}
        friends={this.props.friends} selectedPlayers={this.props.selectedPlayers} />
      )
    };

    return (
      <div>
        with
        <select name="number-of-players" onChange={this.handleChange} >
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
        </select>
        players.
        <div>
          {stepThree}
        </div>
      </div>
    );
  }
})
