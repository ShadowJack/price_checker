@Products = React.createClass
  getInitialState: ->
    products: @props.data
  getDefaultState: ->
    products: []

  render: ->
    `<div id="products">
      <h2> Товары </h2>
      <dl className="accordion" data-accordion>
          { this.props.data.map(function (product){
            return (< Product data={product} key={product.id}/>);
          }) }
      </dl>
    </div>`
