require 'rails_helper'

RSpec.describe "judgements/show", type: :view do
  before(:each) do
    @judgement = assign(:judgement, Judgement.create!(
      file_number: "File Number",
      claimant: "Claimant",
      defendant: "Defendant",
      summary: "MyText",
      court_table: "Court Table",
      notifications: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/File Number/)
    expect(rendered).to match(/Claimant/)
    expect(rendered).to match(/Defendant/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Court Table/)
    expect(rendered).to match(//)
  end
end
