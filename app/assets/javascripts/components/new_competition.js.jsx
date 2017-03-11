var NewCompetitionForm = React.createClass({
  getInitialState: function() {
    return {
      category: "",
      name: "",
      sport_id: "",
      number_of_players: 0,
      user_ids: [],
      type: "",
    }
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var competition = {};
    var name = this.state.name;
    var sport_id = this.state.sport_id;
    var number_of_players = this.state.number_of_players;

    competition["name"] = name
    competition["sport_id"] = sport_id
    competition["number_of_players"] = number_of_players

    console.log(competition);

    $.ajax({
      url: '/competitions',
      dataType: 'json',
      type: 'POST',
      data: {competition: competition}
    });
  },

  handleNameChange: function(e) {
    var name = e.target.name;
    obj = {};
    obj[name] = e.target.value
    this.setState(obj);
  },

  handleCategoryChange: function(e){
    this.setState({category: e.target.value});
  },

  handleSportChange: function(e){
    this.setState({sport_id: e.target.value});
  },

  handleNumberChange: function(obj){
    this.setState({number_of_players: obj});
  },

  render: function() {
    var chosenCategory = this.state.category;
    var stepTwo;

    if (chosenCategory === "Knockout") {
      stepTwo = (
        <NewKnockout friends={this.props.friends}
          key={'knockout'} handleNumberInput={this.handleNumberChange} />
      )
    } else if (chosenCategory === "League") {
      stepTwo = (
        <NewLeague friends={this.props.friends} key={'league'}
          handleNumberInput={this.handleNumberChange} />
      )
    };

    return (
      <div>
        <h1>Create Competition Form</h1>
        <form onSubmit={this.handleSubmit} >
          <input name='name' placeholder='Name your competition'
          value={this.state.name} onChange={this.handleNameChange} />
          <select name="sport_id" value= {this.state.sport_id}
            onChange={this.handleSportChange} >
            <option value="">Which Sport?</option>
            <option value='1'>Tennis</option>
            <option value='2'>Table-Tennis</option>
            <option value='3'>Squash</option>
          </select>
          <select name="category" value= {this.state.category}
            onChange={this.handleCategoryChange}>
            <option value="">Competition Type</option>
            <option value="Knockout">Knockout</option>
            <option value="League">League</option>
          </select>
          <div>
            { stepTwo }
          </div>
        </form>
      </div>
    );
  }
})
