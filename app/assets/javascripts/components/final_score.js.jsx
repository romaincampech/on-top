var FinalScore = React.createClass({

  render: function(){
    return(
      <div>
        <table className="league-final-score">
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
              <th>0</th>
              <td>0</td>
              <td>0</td>
              <td>0</td>
            </tr>
            <tr>
              <th className="text-center">
                {this.props.match.player_two.first_name}
              </th>
              <th>0</th>
              <td>0</td>
              <td>0</td>
              <td>0</td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
})
