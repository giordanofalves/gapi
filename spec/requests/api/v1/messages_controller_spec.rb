require 'rails_helper'

RSpec.describe 'Api::V1::MessagesController', type: :request do
  describe 'POST /api/v1/messages' do
    let!(:message) { FactoryBot.build(:message) }

    context 'empty messages' do
      before { get '/api/v1/messages' }

      it 'returns HTTP status 200' do
        expect(response).to have_http_status 200
      end

      it 'Create a new message' do
        expect(JSON.parse(response.body)).to be_empty
      end
    end

    context 'all messages' do
      before do
        message.save
        get '/api/v1/messages'
      end

      it 'returns HTTP status 200' do
        expect(response).to have_http_status 200
      end

      it 'Create a new message' do
        r = JSON.parse(response.body).first

        expect(message.email).to eq(r['email'])
        expect(message.amount).to eq(r['amount'].to_f)
        expect(message.first_name).to eq(r['first_name'])
        expect(message.last_name).to eq(r['last_name'])
      end
    end
  end

  describe 'POST /api/v1/messages' do
    let!(:params) { FactoryBot.attributes_for(:message) }

    context 'sucess' do
      before { post '/api/v1/messages', params: { message: params } }

      it 'returns HTTP status 200' do
        expect(response).to have_http_status 200
      end

      it 'Create a new message' do
        body = JSON.parse(response.body)

        expect(body['email']).to eq(params[:email])
        expect(body['amount']).to eq(params[:amount].to_f)
        expect(body['first_name']).to eq(params[:first_name])
        expect(body['last_name']).to eq(params[:last_name])
      end
    end

    context 'fail' do
      context 'empty data' do
        before { post '/api/v1/messages' }

        it 'returns HTTP status 422' do
          expect(response).to have_http_status 422
        end

        it 'error message' do
          body = JSON.parse(response.body)
          expect(body['errors']).to eq('param is missing or the value is empty: message')
        end
      end

      context 'wrong data' do
        before do
          params.delete(:email)
          post '/api/v1/messages', params: { message: params }
        end

        it 'returns HTTP status 422' do
          expect(response).to have_http_status 422
        end

        it 'error message' do
          body = JSON.parse(response.body)
          expect(body['errors']['email']).to eq(["can't be blank"])
        end
      end
    end
  end
end
