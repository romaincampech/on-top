var FinalScore = React.createClass({
  render: function(){
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
            <tr>
              <th className="text-center">
                {this.props.match.player_one.first_name}
              </th>
              <th>{this.props.match.score.player_set_total.player_1}</th>
              <td>{this.props.match.score.set1.player_1}</td>
              <td>{this.props.match.score.set2.player_1}</td>
              <td>{this.props.match.score.set3.player_1}</td>
            </tr>
            <tr>
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
