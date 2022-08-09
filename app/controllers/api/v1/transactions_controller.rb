module Api 
  module V1
    class TransactionsController < ApplicationController
      before_action :set_transaction, only: [:show]
    
      # GET /transactions
      def index
        @transactions = Transaction.all
    
        render json: @transactions
      end
    
      # GET /transactions/1
      def show
        render json: @transaction
      end
    
      # POST /transactions
      def create
        @transaction = Transaction.new(transaction_params)
    
        if @transaction.save
          render json: @transaction, status: :created, location: @transaction
        else
          render json: @transaction.errors, status: :unprocessable_entity
        end
      end
    
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_transaction
          @transaction = Transaction.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def transaction_params
          params.require(:transaction).permit(:transaction_id, :customer_id, :input_currency, :input_amount, :output_currency, :output_amount, :trans_status, :active_status, :del_status)
        end
    end
  end
end



