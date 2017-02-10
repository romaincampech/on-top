var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches
    }
  },

  render: function() {
    return (
      <div>
        {this.props.matches.map(function(match){
          return <Match match={match} key={match.id}/>;
        })
      }
      </div>
    );
  }
});
