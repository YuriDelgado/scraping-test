require 'rails_helper'

RSpec.describe "judgements/new", type: :view do
  before(:each) do
    assign(:judgement, Judgement.new(
      file_number: "MyString",
      claimant: "MyString",
      defendant: "MyString",
      summary: "MyText",
      court_table: "MyString",
      notifications: nil
    ))
  end

  it "renders new judgement form" do
    render

    assert_select "form[action=?][method=?]", judgements_path, "post" do

      assert_select "input[name=?]", "judgement[file_number]"

      assert_select "input[name=?]", "judgement[claimant]"

      assert_select "input[name=?]", "judgement[defendant]"

      assert_select "textarea[name=?]", "judgement[summary]"

      assert_select "input[name=?]", "judgement[court_table]"

      assert_select "input[name=?]", "judgement[notifications_id]"
    end
  end
end
