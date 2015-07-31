@App = React.createClass
  componentWillMount: ->
    $.get '/auth/is_signed_in.json', (data) =>
      if data.signed_in
        @setState signedIn: data.signed_in, user: data.user
        @_loadProducts()

  getInitialState: ->
    signedIn: false
    user: null
    products: []

  render: ->
    if @state.signedIn
      authForm = `<SignOutForm email={ this.state.user.email } signOutHandler={ this._signOutHandler } />`
    else
      authForm = `<SignInForm signInHandler={ this._signInHandler } />`
    `<div className="content">
      { authForm }
      <div id="header" className="full_width" >
        <ProductForm addHandler={this.addProductHandler}/>
      </div>
      <div id="content">
        <div className="row">
          <div className="small-12 columns">
            <Products data={ this.state.products } />
          </div>
        </div>
      </div>
    </div>
    `

  _signInHandler: (data)->
    @setState signedIn: true, user: data
    @_loadProducts()

  _signOutHandler: (data)->
    @setState signedIn: false, user: null

  addProductHandler: (product)->
    products = @state.products
    products.push(product)
    @setState products: products

  _loadProducts: ->
    $.get '/api/v1/products.json', (resp) =>
      if (resp.hasOwnProperty('error'))
        console.log resp.error
      else
        @setState products: resp