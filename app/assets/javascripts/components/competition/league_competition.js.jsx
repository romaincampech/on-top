var LeagueCompetition = React.createClass({
  getInitialState: function() {
    return {
      league_table_data: this.props.league_table_data
    }
  },

  updateLeagueTable: function(data) {
    this.setState({league_table_data: data});
  },

  render: function() {

    return (
      <div className="league-competition">
        <div className="league-fixtures">
          <FixtureList matches={this.props.matches} updateTable={this.updateLeagueTable} />
        </div>
        <div>
          <LeagueTable data={this.state.league_table_data} />
        </div>
      </div>
    );
  }
})
