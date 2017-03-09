var NewCompetitionForm = React.createClass({
  getInitialState: function() {
    return {
      category: ""
    }
  },

  handleSubmit: function(e){
    $.post('/competitions', {competition: this.state.competition});
  },

  handleChange: function(e){
    this.setState({category: e.target.value});
  },

  render: function() {
    var chosenCategory = this.state.category;
    var stepTwo;

    if (chosenCategory === "Knockout") {
      stepTwo = (
        <NewKnockout competition={this.props.competition} friends={this.props.friends} key={'knockout'} />
      )
    } else if (chosenCategory === "League") {
      stepTwo = (
        <NewLeague competition={this.props.competition} friends={this.props.friends} key={'league'} />
      )
    };

    return (
      <div>
        <h1>Create Competition Form</h1>
        <form onSubmit={this.handleSubmit(e)} >
          <input name='name' placeholder='Name your competition'
          value={this.props.competition.name} />
          <select name={this.props.competition.sport_id}>
            <option value="">Which Sport?</option>
            <option value='1'>Tennis</option>
            <option value='2'>Table-Tennis</option>
            <option value='3'>Squash</option>
          </select>
          <select name={this.props.competition.category} onChange={this.handleChange}>
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