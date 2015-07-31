@Products = React.createClass
  getInitialState: ->
    products: @props.data
  getDefaultState: ->
    products: []

  render: ->
    `<div id="products">
      <h2> Товары </h2>
      <dl className="accordion" data-accordion>
          { this.props.data.map(function (elem){
            return (< Product data={elem} key={elem.id}/>);
          }) }
      </dl>
    </div>`
