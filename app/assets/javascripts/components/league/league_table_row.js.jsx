var LeagueTableRow = React.createClass({
  render: function() {
    console.log(this.props.player)
    return (
    <tr>
      <td>x</td>
      <td><span>{this.props.player.user_id}</span></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td>{this.props.player.points}</td>
    </tr>

    );
  }
})
