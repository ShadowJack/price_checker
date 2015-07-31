@SignOutForm = React.createClass
  render: ->
    `<div className="auth_form">
      <div className="row">
        <div className="medium-3 medium-offset-7 column">
          <label id="user_email" className="right inline">{this.props.email}</label>
        </div>
        <div className="medium-2 column">
          <button className="button small right" onClick={this._handleSignOutClick}>SignOut</button>
        </div>
      </div>
    </div>`

  _handleSignOutClick: (e)->
    e.preventDefault()
    $.ajax
      url: '/users/sign_out.json'
      method: 'DELETE'
      success: (data, status, xhr) =>
        @props.signOutHandler(data)