require 'rails_helper'

RSpec.describe "judgements/edit", type: :view do
  before(:each) do
    @judgement = assign(:judgement, Judgement.create!(
      file_number: "MyString",
      claimant: "MyString",
      defendant: "MyString",
      summary: "MyText",
      court_table: "MyString",
      notifications: nil
    ))
  end

  it "renders the edit judgement form" do
    render

    assert_select "form[action=?][method=?]", judgement_path(@judgement), "post" do

      assert_select "input[name=?]", "judgement[file_number]"

      assert_select "input[name=?]", "judgement[claimant]"

      assert_select "input[name=?]", "judgement[defendant]"

      assert_select "textarea[name=?]", "judgement[summary]"

      assert_select "input[name=?]", "judgement[court_table]"

      assert_select "input[name=?]", "judgement[notifications_id]"
    end
  end
end
