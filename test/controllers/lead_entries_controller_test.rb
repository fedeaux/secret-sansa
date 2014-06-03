require 'test_helper'

class LeadEntriesControllerTest < ActionController::TestCase
  setup do
    @lead_entry = lead_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lead_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lead_entry" do
    assert_difference('LeadEntry.count') do
      post :create, lead_entry: { date: @lead_entry.date, relation: @lead_entry.relation, text: @lead_entry.text }
    end

    assert_redirected_to lead_entry_path(assigns(:lead_entry))
  end

  test "should show lead_entry" do
    get :show, id: @lead_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lead_entry
    assert_response :success
  end

  test "should update lead_entry" do
    patch :update, id: @lead_entry, lead_entry: { date: @lead_entry.date, relation: @lead_entry.relation, text: @lead_entry.text }
    assert_redirected_to lead_entry_path(assigns(:lead_entry))
  end

  test "should destroy lead_entry" do
    assert_difference('LeadEntry.count', -1) do
      delete :destroy, id: @lead_entry
    end

    assert_redirected_to lead_entries_path
  end
end
