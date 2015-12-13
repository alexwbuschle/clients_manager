require 'test_helper'

class CustomFieldsControllerTest < ActionController::TestCase
  setup do
    login_user
    @custom_field = custom_fields(:moe_favorite_beer)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:custom_fields)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create custom_field' do
    assert_difference('CustomField.count') do
      post :create, custom_field: { name: 'About contact', field_type: 'text', value: '' }
    end

    assert_redirected_to custom_fields_path
  end

  test 'should get edit' do
    get :edit, id: @custom_field
    assert_response :success
  end

  test 'should update custom_field' do
    new_name = 'Changing name'
    patch :update, id: @custom_field, custom_field: { field_type: @custom_field.field_type, name: new_name, user_id: @custom_field.user_id }
    assert_redirected_to custom_fields_path
    assert_equal new_name, @custom_field.reload.name
  end

  test 'should destroy custom_field' do
    assert_difference('CustomField.count', -1) do
      delete :destroy, id: @custom_field
    end

    assert_redirected_to custom_fields_path
  end

  test 'should not see another user custom_fields' do
    login_user(users(:stranger))
    get :index
    assert_response :success
    assert_empty assigns(:custom_fields)
  end
end
