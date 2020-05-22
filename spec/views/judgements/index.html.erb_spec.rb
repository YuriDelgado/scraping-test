require 'rails_helper'

RSpec.describe "judgements/index", type: :view do
  before(:each) do
    assign(:judgements, [
      Judgement.create!(
        file_number: "23/125",
        claimant: "Claimant",
        defendant: "Defendant",
        summary: "MyText",
        court: "Court",
      ),
      Judgement.create!(
        file_number: "23/126",
        claimant: "Claimant",
        defendant: "Defendant",
        summary: "MyText",
        court: "Court"
      )
    ])
  end

  it "renders a list of judgements" do
    render
    assert_select "tr>td", text: "23/125".to_s, count: 1
    assert_select "tr>td", text: "23/126".to_s, count: 1
    assert_select "tr>td", text: "Claimant".to_s, count: 2
    assert_select "tr>td", text: "Defendant".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Court".to_s, count: 2
  end
end
