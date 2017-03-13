var NewKnockout = React.createClass({
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
        friends={this.props.friends} selectedPlayers={this.props.selectedPlayers}/>
      )
    };

    return (
      <div>
        with
        <select value={this.props.number} name="number_of_players"
          id="number-of-players" onChange={this.handleChange} >
          <option value="">How many?</option>
          <option value="2">2</option>
          <option value="4">4</option>
          <option value="8">8</option>
          <option value="16">16</option>
        </select>
        players.
        <div>
          {stepThree}
        </div>
      </div>
    );
  }
})
