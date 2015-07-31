@SignInForm = React.createClass
  getInitialState: ->
    email: ''
    password: ''
    signInBtnText: 'SignIn'
    signUpBtnText: 'SignUp'
    signInSelected: false
    signUpSelected: false

  render: ->
    if !@state.signUpSelected && !@state.signInSelected
      loginFields = `<div className="medium-8 columns"></div>`
    else
      loginFields = `<SignInForm.TextFields email={this.state.email} password={this.state.password} changeHandler={this._handleInputChange}/>`
    `<div className="auth_form">
      <form>
        <div className="row">
          { loginFields }
          <div className="medium-2 column">
            <input type="submit" className="button small" onClick={this._handleSignInClick} defaultValue={ this.state.signInBtnText } disabled={this.state.signUpSelected}/>
          </div>
          <div className="medium-2 column">
              <input type="submit" className="button small" onClick={this._handleSignUpClick} defaultValue={ this.state.signUpBtnText} disabled={this.state.signInSelected} />
          </div>
        </div>
      </form>
    </div>`

  _handleInputChange: (e)->
    name = e.target.name
    @setState "#{name}": e.target.value

  _handleSignInClick: (e)->
    e.preventDefault()
    unless @state.signInSelected
      @setState signInSelected: true, signInBtnText: 'OK', signUpSelected: false, signUpBtnText: 'SignUp'
    else
      $.post '/users/sign_in.json', {user: @state}, (resp)=>
        if resp.hasOwnProperty('error')
          #TODO: do something
        else
          @props.signInHandler(resp)

  _handleSignUpClick: (e)->
    e.preventDefault()
    unless @state.signUpSelected
      @setState signUpSelected: true, singUpBtnText: 'OK', signInSelected: false, signInBtnText: 'SignIn'
    $.post '/users.json', {user: @state}, (rest)=>
      location.reload()

# Subfields to enter login and password
# hidden by default
@SignInForm.TextFields = React.createClass
  render: ->
    `<div className="medium-8 columns">
      <div className="row">
        <div className="medium-3 columns">
            <label htmlFor="email" className="right inline">Email</label>
        </div>
        <div className="medium-3 columns">
            <input type="email"
                   name="email"
                   placeholder="email"
                   value={this.props.email}
                   onChange={this._handleInputChange} />
        </div>
        <div className="medium-3 columns">
            <label htmlFor="password" className="right inline">Password</label>
        </div>
        <div className="medium-3 columns">
            <input type="password"
                   name="password"
                   placeholder="password"
                   value={this.props.password}
                   onChange={this._handleInputChange} />
        </div>
      </div>
    </div>`

  _handleInputChange: (e)->
    @props.changeHandler e


