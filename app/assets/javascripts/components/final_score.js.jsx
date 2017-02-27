var FinalScore = React.createClass({
  render: function(){
    var highlightWinner1;
    var highlightWinner2;

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

    return(
      <div className="league-final-score">
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
      </div>
    );
  }
})
