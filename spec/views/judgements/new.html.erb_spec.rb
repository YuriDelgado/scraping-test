require 'rails_helper'

RSpec.describe "judgements/new", type: :view do
  before(:each) do
    assign(:judgement, Judgement.new(
      file_number: "MyString",
      claimant: "MyString",
      defendant: "MyString",
      summary: "MyText",
      court: "MyString",
    ))
  end

  it "renders new judgement form" do
    render

    assert_select "form[action=?][method=?]", judgements_path, "post" do
      assert_select "input[name=?]", "judgement[url]"
    end
  end
end
