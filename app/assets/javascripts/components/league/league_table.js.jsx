var LeagueTable = React.createClass({
  render: function() {
    var players = this.props.players;
    var data = this.props.data;
    console.log(this.props.data)
    var allTableData = [];
    var tableRows = [];

    for (i=0; i=players.length - 1; i++) {
      console.log(players[{i}]);
      console.log(data[{i}]);
    }

    console.log(all_table_data)

    {this.props.players.map(function(player, j) {
            tableRows.push(<LeagueTableRow player={player} key={j} />)
          })}

    return (
      <table className="league-table">
        <thead>
          <tr>
            <td>Pos.</td>
            <td>Team/Player</td>
            <td>Pl</td>
            <td>W</td>
            <td>D</td>
            <td>L</td>
            <td><strong>Pts</strong></td>
          </tr>
        </thead>

        <tbody>
          {tableRows}



        </tbody>
      </table>
    )
  }
})
