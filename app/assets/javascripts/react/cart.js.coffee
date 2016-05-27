{ div, h1, ul, li, span, a } = React.DOM

orderBlock = React.createFactory React.createClass
  setInitialState: ->
    items: []

  componentWillMount: ->
    @setState(items: @props.items)

  render: ->
    li className: 'row totals',
      span className: 'itemName', 'Total'
      span className: 'price', _.sumBy @state.items, (item)-> item.quantity * item.price
      span className: 'order',
        a className: 'text-center', "ORDER"


cartItem = React.createFactory React.createClass
  setInitialState: ->
    item: {}

  componentWillMount: ->
    @setState(item: @props.item)

  increaseItemCount: ->
    $.ajax
      type: 'POST'
      url: "/products/#{@state.item.product.id}/cart_items"
      dataType: 'json'
      success: =>
        @setState => @state.item.quantity += 1
      error: =>
        window.notifyError('could not add more items')

  decreaseItemCount: ->
    $.ajax
      type: 'DELETE'
      url: "/products/#{@state.item.product.id}/cart_items/#{@state.item.id}"
      dataType: 'json'
      success: =>
        @setState => @state.item.quantity -= 1
      error: =>
        window.notifyError('could not remove item')

  render: ->
      li className: 'row col-md-12', key: @state.item.id,
        span className: "quantity col-md-2", @state.item.quantity
        span className: "itemName col-md-6", @state.item.product.title
        span className: "price col-md-2", @state.item.price
        a className: 'btn btn-primary col-md-1', onClick: @increaseItemCount, '+'
        a className: 'btn btn-primary col-md-1', onClick: @decreaseItemCount, '-'

window.Cart = React.createClass
  getInitialState: ->
    cartItems: []

  componentWillMount: ->
    @setState(cart_items: @props.cart_items)

  render: ->
    div className: 'col-md-7 col-sm-12 text-left',
      ul {},
        li className: "row list-inline columnCaptions",
          span {}, 'QTY'
          span {}, 'ITEM'
          span {}, 'PRICE'

        _.map @state.cart_items, (item) => cartItem(item: item)
        orderBlock(items: @state.cart_items)
