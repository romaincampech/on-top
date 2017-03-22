var NewCompetitionForm = React.createClass({
  getInitialState: function() {
    return {
      category: "",
      name: "",
      sport_id: "",
      number_of_players: 0,
      user_ids: []
    }
  },

  handleSubmit: function(e) {
    e.preventDefault();

    var competition = {};
    var name = this.state.name;
    var category = this.state.category;
    var sport_id = this.state.sport_id;
    var number_of_players = this.state.number_of_players;
    var user_ids = this.state.user_ids;

    competition["name"] = name
    competition["category"] = category
    competition["sport_id"] = sport_id
    competition["number_of_players"] = number_of_players
    competition["user_ids"] = user_ids

    console.log(competition);

    $.ajax({
      type: "POST",
      url: '/competitions',
      dataType: 'json',
      data: {competition: competition},
      success: function(data) {window.location.href = "/competitions/" + data.id;},
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

  handlePlayerSelection: function(obj) {
    this.setState({user_ids: obj})
  },

  render: function() {
    var chosenCategory = this.state.category;
    var stepTwo;

    if (chosenCategory === "Knockout") {
      stepTwo = (
        <NewKnockout friends={this.props.friends}
          key={'knockout'} handleNumberInput={this.handleNumberChange}
            selectedPlayers={this.handlePlayerSelection} />
      )
    } else if (chosenCategory === "League") {
      stepTwo = (
        <NewLeague friends={this.props.friends} key={'league'}
          handleNumberInput={this.handleNumberChange}
            selectedPlayers={this.handlePlayerSelection} />
      )
    };

    return (
      <div>
        <form className="competition-creation-form" onSubmit={this.handleSubmit} >
        <h1 className="form-title">Create Your Competition!</h1>
          I would like to create a<select name="sport_id" value= {this.state.sport_id}
            onChange={this.handleSportChange} className="custom-select" >
            <option value="">Sport</option>
            <option value='1'>Tennis</option>
            <option value='2'>Table-Tennis</option>
            <option value='3'>Squash</option>
          </select><select name="category" value= {this.state.category}
            onChange={this.handleCategoryChange}>
            <option value="">Competition Type</option>
            <option value="Knockout">Knockout</option>
            <option value="League">League</option>
          </select>
          competition called<input name='name' placeholder='Name your competition'
          value={this.state.name} onChange={this.handleNameChange} />{ stepTwo }
        </form>
      </div>
    );
  }
})
