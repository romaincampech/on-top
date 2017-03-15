var FixtureList = React.createClass ({
  getInitialState: function() {
    return {
      fixtures: this.props.matches,
      active_tab: ""
    }
  },

  setNewMatch: function(data) {
    console.log(data["matches"]);
    this.setState({fixtures: data["matches"]});
  },

  handleTab: function(x) {
    console.log(x);
    this.setState({active_tab: x});
  },

  render: function() {
    var tabs = [];
    var players = this.props.matches[0]["competition_participants"];
    players.map(function(player, i){
        tabs.push(<PlayerTab player={player} key={i} handleClick={this.handleTab}
            active={this.state.active_tab} />);
    }.bind(this))

    var arr=[];
    players.forEach(function(player, i){
        arr.push(<PlayerFixtures fixtures={this.state.fixtures}
          player={player} key={i} updateMatches={this.setNewMatch}
            active={this.state.active_tab} />);
    }.bind(this))

    return (
      <div>
        <div className="tabs">
          {tabs}
        </div>
        <div>
          {arr}
        </div>
      </div>
    );
  }
});
