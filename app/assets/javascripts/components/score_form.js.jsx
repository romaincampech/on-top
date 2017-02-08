var ScoreForm = React.createClass({
  render: function(){
    return (
      <form className="score-form-tennis">
        <table>
          <thead>
            <tr>
              <th rowSpan="2">Player</th>
              <th colSpan="3">Set</th>
            </tr>
            <tr>
              <th>1</th>
              <th>2</th>
              <th>3</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>{this.props.match.player_one.first_name}</th>
              <td><input type="number" name="set1player1" /></td>
              <td><input type="number" name="set2player1" /></td>
              <td><input type="number" name="set3player1" /></td>
            </tr>
            <tr>
              <th>{this.props.match.player_two.first_name}</th>
              <td><input type="number" name="set1player2" /></td>
              <td><input type="number" name="set2player2" /></td>
              <td><input type="number" name="set3player2" /></td>
            </tr>
          </tbody>
        </table>
        <input type='submit' value='Submit Score' className="btn btn-sm result-input-btn" />
      </form>
    );
  }
})
