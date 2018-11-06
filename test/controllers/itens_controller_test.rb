require 'test_helper'

class ItensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item = itens(:one)
  end

  test "should get index" do
    get itens_url
    assert_response :success
  end

  test "should get new" do
    get new_item_url
    assert_response :success
  end

  test "should create item" do
    assert_difference('Item.count') do
      post itens_url, params: { item: { pedido_id: @item.pedido_id, produto_id: @item.produto_id, quantidade: @item.quantidade } }
    end

    assert_redirected_to item_url(Item.last)
  end

  test "should show item" do
    get item_url(@item)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_url(@item)
    assert_response :success
  end

  test "should update item" do
    patch item_url(@item), params: { item: { pedido_id: @item.pedido_id, produto_id: @item.produto_id, quantidade: @item.quantidade } }
    assert_redirected_to item_url(@item)
  end

  test "should destroy item" do
    assert_difference('Item.count', -1) do
      delete item_url(@item)
    end

    assert_redirected_to itens_url
  end
end
