var NewKnockout = React.createClass({
  render: function() {
    return (
      <div>
        <label for="number-of-players">Choose # of players:</label>
        <select name={this.props.competition.number_of_players} id="number-of-players">
          <option value="2">2</option>
          <option value="4">4</option>
          <option value="8">8</option>
          <option value="16">16</option>
        </select>

      </div>
    );
  }
})
