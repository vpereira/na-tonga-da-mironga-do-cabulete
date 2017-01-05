require 'test_helper'

class PackageFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @package_file = package_files(:one)
  end

  test "should get index" do
    get package_files_url
    assert_response :success
  end

  test "should get new" do
    get new_package_file_url
    assert_response :success
  end

  test "should create package_file" do
    assert_difference('PackageFile.count') do
      post package_files_url, params: { package_file: { content: @package_file.content, package_id: @package_file.package_id, path: @package_file.path } }
    end

    assert_redirected_to package_file_url(PackageFile.last)
  end

  test "should show package_file" do
    get package_file_url(@package_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_package_file_url(@package_file)
    assert_response :success
  end

  test "should update package_file" do
    patch package_file_url(@package_file), params: { package_file: { content: @package_file.content, package_id: @package_file.package_id, path: @package_file.path } }
    assert_redirected_to package_file_url(@package_file)
  end

  test "should destroy package_file" do
    assert_difference('PackageFile.count', -1) do
      delete package_file_url(@package_file)
    end

    assert_redirected_to package_files_url
  end
end
