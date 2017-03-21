var LeagueTableRow = React.createClass({
  render: function() {
    return (
    <tr>
      <td>{this.props.player.position}</td>
      <td>{this.props.player.name}</td>
      <td>{this.props.player.matches_played}</td>
      <td>{this.props.player.matches_won}</td>
      <td>{this.props.player.matches_drawn}</td>
      <td>{this.props.player.matches_lost}</td>
      <td>{this.props.player.points}</td>
    </tr>

    );
  }
})
