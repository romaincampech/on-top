var SelectPlayers = React.createClass({
  handleChange: function(e) {
    var options = e.target.options;
    var playersArray = [];
    for (var i = 0, l = options.length; i < l; i++) {
      if (options[i].selected) {
      playersArray.push(options[i].value);
      }
    }
    this.props.selectedPlayers(playersArray);
  },

  render: function() {
    console.log(this.props.friends);
    var friends = this.props.friends;

    return (
      <div>
        I would like to invite
        <select className="select optional chosen-select individual-chosen-select"
          data-placeholder=" " multiple="multiple" name="competition[user_ids][]"
            id="competition_user_ids" onChange={this.handleChange} >
            {
              friends.map(function(friend) {
              return <option value={friend.id} key={friend.id} >
              {friend.first_name + " " + friend.last_name}</option>
              })
            }
        </select>
        to the competition.<br/>
        <input type='submit' value='Create Competition' className='competition-new-btn' />
      </div>
    );
  }
})
