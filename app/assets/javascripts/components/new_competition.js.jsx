var NewCompetitionForm = React.createClass({
  getInitialState: function() {
    return {
      category: "",
      name: "",
      sport_id: "",
      number_of_players: "",
      user_ids: [],
      type: "",
    }
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

  handleNumberInput: function(obj){
    this.setState({number_of_players: obj});
  },

  render: function() {
    var chosenCategory = this.state.category;
    var stepTwo;

    if (chosenCategory === "Knockout") {
      stepTwo = (
        <NewKnockout number={this.state.number_of_players} friends={this.props.friends}
          key={'knockout'} handleNumberInput={this.handleNumberInput()} />
      )
    } else if (chosenCategory === "League") {
      stepTwo = (
        <NewLeague competition={this.props.competition} friends={this.props.friends} key={'league'} />
      )
    };

    return (
      <div>
        <h1>Create Competition Form</h1>
        <form>
          <input name='name' placeholder='Name your competition'
          value={this.state.name} onChange={this.handleNameChange} />
          <select name="sport_id" onChange={this.handleSportChange} >
            <option value="">Which Sport?</option>
            <option value='1'>Tennis</option>
            <option value='2'>Table-Tennis</option>
            <option value='3'>Squash</option>
          </select>
          <select name="category" onChange={this.handleCategoryChange}>
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
