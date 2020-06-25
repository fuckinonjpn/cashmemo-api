# frozen_string_literal: true

class Api::V1::TransactionsController < ApplicationController
  def create
    transaction = @current_user.transactions.create!(transaction_params)
    render json: transaction
  end

  def update
    transaction = Transaction.find(params[:id])
    transaction.update!(transaction_params)
    render json: transaction
  end

  def destroy
    Transaction.find(params[:id]).destroy
    render json: { message: 'success' }, status: :ok
  end

  def index
    transactions = @current_user.transactions
    render json: transactions
  end

  def show
    transaction = Transaction.find(params[:id])
    render json: transaction
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :amount, :content, :category, :transaction_type
    )
  end
end
