$(document).ready ->
  baseUrl = 'http://devpoint-ajax-example-server.herokuapp.com/api/v1'
  $.ajax
    url: "#{baseUrl}/products"
    type: 'GET'
    success: (data) ->
      for product in data.products
        $.ajax
          url: '/product_card'
          type: 'GET'
          data:
            product: product
          success: (data) ->
            $('#products').append data
          error: (data) ->
            conslole.log data
          error: (data) ->
      console.log data 

      $(document).onClick '.show_product', 
      -> (e) e.preventDefault

      $(document).onClick '.delete_product', 
      -> (e) e.preventDefault

      $.ajax
      url:  baseUrl + 'products/' + $this.attr 'href',
      type: 'DELETE',
      success: ->
        $('.alert').text(data.message).removeClass 'hide'
        error: -> (data)
        console.log(data)
