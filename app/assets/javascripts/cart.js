function changeQuantity(ele) {
  $.ajax({
    type: 'PATCH',
    url: '/carts/' + $(ele).data('id'),
    data: {quantity: $(ele).val()}
  })
}
