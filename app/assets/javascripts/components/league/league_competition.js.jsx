var LeagueCompetition = React.createClass({


  render: function() {
    console.log(this.props)



    return (
      <div>
        <div>
          <LeagueTable data={this.props.league_table_data}/>
        </div>
        <div className="fixtures-header">
          <h4><strong>League Fixtures/Results</strong></h4>
        </div>
        <div className="fixtures-display">

          <div className="league-fixtures">
            <FixtureList matches={this.props.matches} />
          </div>
        </div>
      </div>
    );
  }
})
