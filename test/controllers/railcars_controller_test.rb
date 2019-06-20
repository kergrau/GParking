require 'test_helper'

class RailcarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @railcar = railcars(:one)
  end

  test "should get index" do
    get railcars_url
    assert_response :success
  end

  test "should get new" do
    get new_railcar_url
    assert_response :success
  end

  test "should create railcar" do
    assert_difference('Railcar.count') do
      post railcars_url, params: { railcar: { marca: @railcar.marca, modelo: @railcar.modelo, person_id: @railcar.person_id, placa: @railcar.placa, tipo: @railcar.tipo } }
    end

    assert_redirected_to railcar_url(Railcar.last)
  end

  test "should show railcar" do
    get railcar_url(@railcar)
    assert_response :success
  end

  test "should get edit" do
    get edit_railcar_url(@railcar)
    assert_response :success
  end

  test "should update railcar" do
    patch railcar_url(@railcar), params: { railcar: { marca: @railcar.marca, modelo: @railcar.modelo, person_id: @railcar.person_id, placa: @railcar.placa, tipo: @railcar.tipo } }
    assert_redirected_to railcar_url(@railcar)
  end

  test "should destroy railcar" do
    assert_difference('Railcar.count', -1) do
      delete railcar_url(@railcar)
    end

    assert_redirected_to railcars_url
  end
end
