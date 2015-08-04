@Product = React.createClass
  getInitialState: ->
    active: false
    chart_data:
      labels: ['one', 'two', 'thee']
      series: [[1,2,3]]

  render: ->
    title = @props.data.description || @props.data.url

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
            < PriceChart data={ this.state.chart_data } key={"price_chart" + this.props.data.id} /> 
          </div>
        </div>
      </div>
    </dd>`

  _togglePanel: (e)->
    e.preventDefault()
    $.get '/api/v1/products/' + @props.data.id + '/prices.json', (resp) =>
      if (resp.hasOwnProperty('error'))
        console.log resp.error
      else
        @setState chart_data:
          labels: resp.map (curr, idx, arr) ->
            new Date(curr.updated_at).toLocaleDateString()
          series: [resp.map (curr, idx, arr) -> curr.price]
        ,active: !@state.active

