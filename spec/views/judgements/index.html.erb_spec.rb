require 'rails_helper'

RSpec.describe "judgements/index", type: :view do
  before(:each) do
    assign(:judgements, [
      Judgement.create!(
        file_number: "File Number",
        claimant: "Claimant",
        defendant: "Defendant",
        summary: "MyText",
        court_table: "Court Table",
        notifications: nil
      ),
      Judgement.create!(
        file_number: "File Number",
        claimant: "Claimant",
        defendant: "Defendant",
        summary: "MyText",
        court_table: "Court Table",
        notifications: nil
      )
    ])
  end

  it "renders a list of judgements" do
    render
    assert_select "tr>td", text: "File Number".to_s, count: 2
    assert_select "tr>td", text: "Claimant".to_s, count: 2
    assert_select "tr>td", text: "Defendant".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "Court Table".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
