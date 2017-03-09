var newCompetitionForm = React.createClass({
  getInitialState: function() {
    return {
      category: ""
    }
  },

  handleChange: function(e){
    this.setState({category: e.target.value});
  },

  render: function() {
    var chosenCategory = this.state.category;
    var stepTwo;

    if (chosenCategory === "Knockout") {
      stepTwo = (
        <newKnockout competition={this.props.competition} key={'knockout'} />
      )
    } else if (chosenCategory === "League") {
      stepTwo = (
        <newLeague competition={this.props.competition} key={'league'} />
      )
    };

    return (
      <div>
        <h1>Create Competition Form</h1>
        <form>
          <input name='name' placeholder='Name your competition'
          value={this.props.competition.name} />
          <select name='sport_id'>
            <option value="">Which Sport?</option>
            <option value='1'>Tennis</option>
            <option value='2'>Table-Tennis</option>
            <option value='3'>Squash</option>
          </select>
          <select name='category' placeholder='Knockout or League?'
          value={this.props.competition.category} onChange={this.handleChange}>
            <option value="">Competition Type</option>
            <option value="Knockout">Knockout</option>
            <option value="League">League</option>
          </select>
          <div>
            { stepTwo }
          </div>

          <input type='submit' value='Create Competition' className='competition-new-btn btn-individual' />
        </form>
      </div>
    );
  }
})
