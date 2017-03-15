var LeagueTable = React.createClass({
  render: function() {
    var tableRows = [];

    {this.props.data.map(function(player, j) {
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
