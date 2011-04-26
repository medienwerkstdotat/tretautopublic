require 'test_helper'

class AutosControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Auto.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Auto.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Auto.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to auto_url(assigns(:auto))
  end

  def test_edit
    get :edit, :id => Auto.first
    assert_template 'edit'
  end

  def test_update_invalid
    Auto.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Auto.first
    assert_template 'edit'
  end

  def test_update_valid
    Auto.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Auto.first
    assert_redirected_to auto_url(assigns(:auto))
  end

  def test_destroy
    auto = Auto.first
    delete :destroy, :id => auto
    assert_redirected_to autos_url
    assert !Auto.exists?(auto.id)
  end
end
