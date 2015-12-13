require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  setup do
    login_user
    @contact = contacts(:homer_moes_contact)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts)
    assert_equal 1, assigns(:contacts).count
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create contacts' do
    custom_field = custom_fields(:moe_favorite_beer)
    assert_difference('Contact.count') do
      post :create, contact: { name: 'Barney Gumble', email: 'barney@burrrrpp.com' }, customs: [{ custom_field.id => 'Duff' }]
    end
    contact = Contact.order(:created_at).last
    assert_redirected_to contact_path(contact)
  end

  test 'should show contacts' do
    get :show, id: @contact
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @contact
    assert_response :success
  end

  test 'should update contacts' do
    custom_field = custom_fields(:moe_favorite_beer)
    post :update, id: @contact.id, contact: { name: 'New name', email: @contact.email }, customs: [{ custom_field.id => 'Duff' }]

    assert_redirected_to contact_path(@contact)
  end

  test 'should destroy contacts' do
    assert_difference('Contact.where("deleted_at is null").count', -1) do
      delete :destroy, id: @contact
    end

    assert_redirected_to contacts_path
  end

  test 'should not see another user contact' do
    login_user(users(:stranger))
    get :index
    assert_response :success
    assert_empty assigns(:contacts)
  end
end
