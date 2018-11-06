require 'test_helper'

class SubCategoriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_categoria = sub_categorias(:one)
  end

  test "should get index" do
    get sub_categorias_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_categoria_url
    assert_response :success
  end

  test "should create sub_categoria" do
    assert_difference('SubCategoria.count') do
      post sub_categorias_url, params: { sub_categoria: { categoria_id: @sub_categoria.categoria_id, nome: @sub_categoria.nome } }
    end

    assert_redirected_to sub_categoria_url(SubCategoria.last)
  end

  test "should show sub_categoria" do
    get sub_categoria_url(@sub_categoria)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_categoria_url(@sub_categoria)
    assert_response :success
  end

  test "should update sub_categoria" do
    patch sub_categoria_url(@sub_categoria), params: { sub_categoria: { categoria_id: @sub_categoria.categoria_id, nome: @sub_categoria.nome } }
    assert_redirected_to sub_categoria_url(@sub_categoria)
  end

  test "should destroy sub_categoria" do
    assert_difference('SubCategoria.count', -1) do
      delete sub_categoria_url(@sub_categoria)
    end

    assert_redirected_to sub_categorias_url
  end
end
