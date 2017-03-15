var PlayerTab = React.createClass({

  handleClick: function(e) {
    e.preventDefault;
    this.props.handleClick(this.props.player.id);
  },

  render: function() {
    var active_tab;

    if (this.props.active === this.props.player.id) {
      active_tab = "active";
    };

    return (
      <div className={"fixtures-tab " + active_tab} onClick={this.handleClick}>
         <h4>{this.props.player.first_name}</h4>
      </div>
    )
  }
})
