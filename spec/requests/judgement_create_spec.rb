require 'rails_helper'

describe JudgementsController do
  describe "#create" do
    let(:params) { { 
        judgement: {
          url: "http://www.example.com"
        }
      }
    }

    let(:judgement) {
      Judgement.new({
        file_number: '123/456',
        claimant: 'Mr. Jones',
        defendant: 'Saul Goodman',
        summary: 'Expedient in process, started last month',
        court: 'Mexico DF > 4 tribunal de distrito'
      })
    }

    let(:judgement_error) {
      Judgement.new({
        claimant: 'Mr. Jones',
        defendant: 'Saul Goodman',
        summary: 'Expedient in process, started last month',
        court: 'Mexico DF > 4 tribunal de distrito'
      })
    }


    context "Judgement successful" do
      before do
        allow(PjvScrapingService).to receive(:new) {
          -> { judgement }
        }
      end

      it "returns a correct status code" do
        post judgements_url, params: params
        expect(flash.notice).to eq "Judgement was successfully created."
        expect(response.status).to eq 302
      end
    end
    
    context "Judgement failed" do
      before do
        allow(PjvScrapingService).to receive(:new) {
          -> { judgement_error }
        }
      end
      
      it "returns a correct status code" do
        post judgements_url, params: params
        expect(response.status).to eq 422
      end
    end

  end
end