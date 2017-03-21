var FinalScore = React.createClass({
  handleClick: function(e){
    e.preventDefault();
    this.props.toggleClick();
  },

  render: function(){
    var highlightWinner1;
    var highlightWinner2;
    var editButton;

    if (this.props.match.player_one.id === this.props.match.winner.id) {
      highlightWinner1 = "highlight";
    } else {
      highlightWinner1 = "";
    }

    if (this.props.match.player_two.id === this.props.match.winner.id) {
      highlightWinner2 = "highlight";
    } else {
      highlightWinner2 = "";
    }

    // if current user is competition creator
      editButton = (
        <div id={this.props.match.match_number}>
          <button className="btn league-result-input-btn"
            onClick={this.handleClick} >Edit Score</button>
        </div>
      )

    var finalScore;

    if (this.props.match.competition.sport_id === 1) {
      finalScore = (
        <table>
          <thead>
            <tr>
              <th>Player</th>
              <th>Sets</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
            </tr>
          </thead>
          <tbody>
            <tr className={highlightWinner1}>
              <th className="text-center">
                {this.props.match.player_one.first_name}
              </th>
              <th>{this.props.match.score.player_set_total.player_1}</th>
              <td>{this.props.match.score.set1.player_1}</td>
              <td>{this.props.match.score.set2.player_1}</td>
              <td>{this.props.match.score.set3.player_1}</td>
            </tr>
            <tr className={highlightWinner2}>
              <th className="text-center">
                {this.props.match.player_two.first_name}
              </th>
              <th>{this.props.match.score.player_set_total.player_2}</th>
              <td>{this.props.match.score.set1.player_2}</td>
              <td>{this.props.match.score.set2.player_2}</td>
              <td>{this.props.match.score.set3.player_2}</td>
            </tr>
          </tbody>
        </table>
      )
    } else {
      finalScore = (
        <table>
          <thead>
            <tr>
              <th>Player</th>
              <th>Sets</th>
              <th>1</th>
              <th>2</th>
              <th>3</th>
              <th>4</th>
              <th>5</th>
            </tr>
          </thead>
          <tbody>
            <tr className={highlightWinner1}>
              <th className="text-center">
                {this.props.match.player_one.first_name}
              </th>
              <th>{this.props.match.score.player_set_total.player_1}</th>
              <td>{this.props.match.score.set1.player_1}</td>
              <td>{this.props.match.score.set2.player_1}</td>
              <td>{this.props.match.score.set3.player_1}</td>
              <td>{this.props.match.score.set4.player_1}</td>
              <td>{this.props.match.score.set5.player_1}</td>
            </tr>
            <tr className={highlightWinner2}>
              <th className="text-center">
                {this.props.match.player_two.first_name}
              </th>
              <th>{this.props.match.score.player_set_total.player_2}</th>
              <td>{this.props.match.score.set1.player_2}</td>
              <td>{this.props.match.score.set2.player_2}</td>
              <td>{this.props.match.score.set3.player_2}</td>
              <td>{this.props.match.score.set4.player_2}</td>
              <td>{this.props.match.score.set5.player_2}</td>
            </tr>
          </tbody>
        </table>
      )
    }


    return(
      <div className="league-final-score">
        {finalScore}
      </div>
    );
  }
})
