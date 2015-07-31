@PriceChart = React.createClass
  componentDidMount: ->
    @updateChart(this.props.data)

  componentWillUnmount: ->
  if (@chartist)
    try
      @chartist.detach()
    catch err
      throw new Error('Internal chartist error', err);

  updateChart: (data)->
    if (@chartist)
      @chartist.update(data, {}, {})
    else
      @chartist = new Chartist.Line(React.findDOMNode(@), data, {}, {})
    @chartist

  render: ->
    `<div className="ct-chart ct-golden-section"> </div>`