var PlayerTab = React.createClass({

  handleClick: function(e) {
    e.preventDefault;
    this.props.handleClick(this.props.player.id);
  },

  render: function() {
    return (
      <div className="fixtures-tab" onClick={this.handleClick}>
         <h4>{this.props.player.first_name}</h4>
      </div>
    )
  }
})
