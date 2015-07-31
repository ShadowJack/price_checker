@Product = React.createClass
  getInitialState: ->
    active: false

  render: ->
    title = @props.data.description || @props.data.url
    chart_data =
      labels: @props.data.prices.dates, #TODO: send prices from backend and display on chart
      series: @props.data.prices.values

    `<dd className="accordion-navigation">
      <a href={ "#panel" + this.props.data.id } onClick={ this._togglePanel }> { title } </a>
      <div id={ "panel" + this.props.data.id } className={ "content " + (this.state.active ? "active" : "") }>
        <div className="row">
          <div className="small-6 columns">
            <a href={ this.props.data.url }> { this.props.data.url } </a>
          </div>
          <div className="small-6 columns">
            <p> Желаемая цена: { this.props.data.aim_price } руб.</p>
          </div>
        </div>
        <div className="row">
          <div className="small-12 column">
            <PriceChart data={ chart_data } />
          </div>
        </div>
      </div>
    </dd>`

  _togglePanel: (e)->
    e.preventDefault()
    @setState active: !@state.active
