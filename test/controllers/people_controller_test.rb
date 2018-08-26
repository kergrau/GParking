require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = people(:one)
  end

  test "should get index" do
    get people_url
    assert_response :success
  end

  test "should get new" do
    get new_person_url
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post people_url, params: { person: { apellido1: @person.apellido1, apellido2: @person.apellido2, correo: @person.correo, direccion: @person.direccion, dni: @person.dni, nombre1: @person.nombre1, nombre2: @person.nombre2, telefono: @person.telefono } }
    end

    assert_redirected_to person_url(Person.last)
  end

  test "should show person" do
    get person_url(@person)
    assert_response :success
  end

  test "should get edit" do
    get edit_person_url(@person)
    assert_response :success
  end

  test "should update person" do
    patch person_url(@person), params: { person: { apellido1: @person.apellido1, apellido2: @person.apellido2, correo: @person.correo, direccion: @person.direccion, dni: @person.dni, nombre1: @person.nombre1, nombre2: @person.nombre2, telefono: @person.telefono } }
    assert_redirected_to person_url(@person)
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete person_url(@person)
    end

    assert_redirected_to people_url
  end
end
