var KnockoutCompetition = React.createClass({


  render: function() {
    console.log(this.props.matches[0].competition.number_of_rounds);

    var rounds_display = [];
    var rounds = this.props.matches[0].competition.number_of_rounds;

    for (var i=1; i=rounds; i++) {
      rounds_display.push(<KnockoutRound matches={this.props.matches} round={i} key={i} />);
    }

    return (
      <div>
      {rounds_display}
      </div>
    );
  }
})
