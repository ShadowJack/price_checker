@ProductForm = React.createClass
  getInitialState: ->
    url: '',
    aim_price: null,
    url_error_hidden: true,
    price_error_hidden: true

  render: ->

    url_error = if @state.url_error_hidden then `<div></div>` else  `<small className="error">Пожалуйста введите полный путь к странице с товаром</small>`
    price_error = if @state.price_error_hidden then `<div></div>` else `<small className="error" >Пожалуйста введите натуральное число</small>`
    `<form key="header">
      <div className="row">
        <div className="small-6 small-offset-3 column">
          <div className="input-wrapper">
            <input type="url" value={this.state.url} name="url" placeholder="Ссылка на товар" onChange={ this._handleChange } onBlur={ this._validateUrl } />
            { url_error }
          </div>
        </div>
      </div>
      <div className="row">
        <div className="small-6 small-offset-3 column">
          <div className="input-wrapper">
            <input type="text" value={this.state.aim_price} name="aim_price" placeholder="Желаемая цена" onChange={ this._handleChange } onBlur={ this._validatePrice }/>
            { price_error }
          </div>
        </div>
      </div>
      <div className="row">
        <div className="small-2 small-offset-5 column text-center">
          <a href="#" className="button" onClick={ this._handleClick }>Add</a>
        </div>
      </div>
    </form>`

  _validateUrl: (e)->
    # Some crazy regexp from http://blog.roymj.co.in/url-validation-using-regular-expression-javascript/
    regExp =/^(?:(?:https?|ftp):\/\/)(?:\S+(?::\S*)?@)?(?:(?!10(?:\.\d{1,3}){3})(?!127(?:\.\d{1,3}){3})(?!169\.254(?:\.\d{1,3}){2})(?!192\.168(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]+-?)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/[^\s]*)?$/i;

    if !@state.url || !regExp.test(@state.url)
      @setState url_error_hidden: false
    else
      @setState url_error_hidden: true

  _validatePrice: (e)->
    if @state.aim_price && (isNaN(parseInt(@state.aim_price)) || !isFinite(@state.aim_price))
      @setState price_error_hidden: false
    else
      @setState price_error_hidden: true

  _handleChange: (e)->
    name = e.target.name
    @setState "#{name}": e.target.value

  _handleClick: (e)->
    e.preventDefault()
    $.post '/api/v1/products.json', { product: @state }, (result) =>
      if (result.hasOwnProperty('error'))
        console.log "Error:", result.error
      else
        @setState(@getInitialState())
        @props.addHandler(result)
    , 'JSON'