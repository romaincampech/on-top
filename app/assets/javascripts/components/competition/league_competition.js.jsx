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
      <div>
        <div>
          <LeagueTable data={this.state.league_table_data} />
        </div>
        <div className="fixtures-header">
          <h4><strong>Fixtures/Results</strong></h4>
        </div>
        <div className="league-fixtures">
          <FixtureList matches={this.props.matches} updateTable={this.updateLeagueTable} />
        </div>
      </div>
    );
  }
})
