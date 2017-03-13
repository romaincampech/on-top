var InvitePlayers = React.createClass({
  getInitialState: function() {
    return {
    user_ids: []
    }
  },

  handleChange: function(e) {
    var options = e.target.options;
    var playersArray = [];
    for (var i = 0, l = options.length; i < l; i++) {
      if (options[i].selected) {
      playersArray.push(options[i].value);
      }
    }
    this.selectedPlayers(playersArray);
  },

  selectedPlayers: function(obj) {
    this.setState({user_ids: obj})
  },

  handleSubmit: function(e){
    e.preventDefault;
    var competition = {};
    var updateUrl = "/competitions/" + this.props.competition.id;
    var user_ids = this.state.user_ids;
    competition["user_ids"] = user_ids

    console.log(this.props.competition.id);
    console.log(updateUrl);

    $.ajax({
      type: "PATCH",
      url: updateUrl,
      dataType: 'json',
      data: {competition: competition},
      success: function(data) {window.location.href = "/competitions/" + data.id;},
    });
  },

  render: function() {

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
        to the competition.
        <input onClick={this.handleSubmit} type='submit' value='Invite Players' className='competition-new-btn' />
      </div>
    );
  }
});
