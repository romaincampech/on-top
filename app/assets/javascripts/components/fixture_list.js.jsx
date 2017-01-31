var FixtureList = React.createClass ({
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
