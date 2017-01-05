require 'test_helper'

class CodestreamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @codestream = codestreams(:one)
  end

  test "should get index" do
    get codestreams_url
    assert_response :success
  end

  test "should get new" do
    get new_codestream_url
    assert_response :success
  end

  test "should create codestream" do
    assert_difference('Codestream.count') do
      post codestreams_url, params: { codestream: { name: @codestream.name } }
    end

    assert_redirected_to codestream_url(Codestream.last)
  end

  test "should show codestream" do
    get codestream_url(@codestream)
    assert_response :success
  end

  test "should get edit" do
    get edit_codestream_url(@codestream)
    assert_response :success
  end

  test "should update codestream" do
    patch codestream_url(@codestream), params: { codestream: { name: @codestream.name } }
    assert_redirected_to codestream_url(@codestream)
  end

  test "should destroy codestream" do
    assert_difference('Codestream.count', -1) do
      delete codestream_url(@codestream)
    end

    assert_redirected_to codestreams_url
  end
end
