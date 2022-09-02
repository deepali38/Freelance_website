require "application_system_test_case"

class UploadFilesTest < ApplicationSystemTestCase
  setup do
    @upload_file = upload_files(:one)
  end

  test "visiting the index" do
    visit upload_files_url
    assert_selector "h1", text: "Upload files"
  end

  test "should create upload file" do
    visit upload_files_url
    click_on "New upload file"

    click_on "Create Upload file"

    assert_text "Upload file was successfully created"
    click_on "Back"
  end

  test "should update Upload file" do
    visit upload_file_url(@upload_file)
    click_on "Edit this upload file", match: :first

    click_on "Update Upload file"

    assert_text "Upload file was successfully updated"
    click_on "Back"
  end

  test "should destroy Upload file" do
    visit upload_file_url(@upload_file)
    click_on "Destroy this upload file", match: :first

    assert_text "Upload file was successfully destroyed"
  end
end
