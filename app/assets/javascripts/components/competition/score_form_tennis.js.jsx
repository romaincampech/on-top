var ScoreFormTennis = React.createClass({

  handleSubmit: function(e){
    e.preventDefault();
    this.props.onFormSubmit();
  },

  handleChange: function(e) {
    var name = e.target.name;
    var points = e.target.value;
    this.props.onUserInput(name, points);
  },

  render: function(){
    var scoreForm;
    console.log(this.props.match.competition.sport_id);
    if (this.props.match.competition.sport_id === 1) {
      scoreForm = (
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
              <td><input type="number" name="set1player1" onChange={this.handleChange} /></td>
              <td><input type="number" name="set2player1" onChange={this.handleChange} /></td>
              <td><input type="number" name="set3player1" onChange={this.handleChange} /></td>
            </tr>
            <tr>
              <th>{this.props.match.player_two.first_name}</th>
              <td><input type="number" name="set1player2" onChange={this.handleChange} /></td>
              <td><input type="number" name="set2player2" onChange={this.handleChange} /></td>
              <td><input type="number" name="set3player2" onChange={this.handleChange} /></td>
            </tr>
          </tbody>
        </table>
      )
    } else {
      scoreForm = (
        <table>
          <thead>
            <tr>
              <th rowSpan="2">Player</th>
              <th colSpan="5">Set</th>
            </tr>
            <tr>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <th>{this.props.match.player_one.first_name}</th>
              <td><input type="number" name="set1player1" onChange={this.handleChange} /></td>
              <td><input type="number" name="set2player1" onChange={this.handleChange} /></td>
              <td><input type="number" name="set3player1" onChange={this.handleChange} /></td>
              <td><input type="number" name="set4player1" onChange={this.handleChange} /></td>
              <td><input type="number" name="set5player1" onChange={this.handleChange} /></td>
            </tr>
            <tr>
              <th>{this.props.match.player_two.first_name}</th>
              <td><input type="number" name="set1player2" onChange={this.handleChange} /></td>
              <td><input type="number" name="set2player2" onChange={this.handleChange} /></td>
              <td><input type="number" name="set3player2" onChange={this.handleChange} /></td>
              <td><input type="number" name="set4player2" onChange={this.handleChange} /></td>
              <td><input type="number" name="set5player2" onChange={this.handleChange} /></td>
            </tr>
          </tbody>
        </table>
      )
    }

    return (
      <div>
        <form className="score-form-league tennis" onSubmit={this.handleSubmit} >
            {scoreForm}
          <input type='submit' value='Submit Score' className="btn btn-sm result-input-btn" />
        </form>
      </div>
    );
  }
})
