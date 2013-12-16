require 'test_helper'

class ReportControllerTest < ActionController::TestCase
  test "should show the index page" do
    get 'index'
    assert_response(:success)
    assert_select 'title', I18n.t(:report_index_title)
  end

  test "should show the show page" do
    gomphidius = reports(:gomphidius)
    get 'show', :id => gomphidius.id
    assert_response(:success)
  end

  test "with no id show redirect should redirect to index" do
    get 'show'
    assert_redirected_to(action: 'index')
  end
end
