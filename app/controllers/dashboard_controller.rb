require 'json'
require 'date'
class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard.html.erb'

  def show
    @user = User.find(current_user.id)
    @user_corp = @user.corp
    if @user_corp == 'csi'
      emp
    else
      cli
    end
  end

  def cli
    render 'dashboard/cli'
  end

  def search_index
    @states = [[],["AR", "AR"], ["AK", "AK"]]
    @years = [[]]
    (1996...2019).step(1) do |year|
      @years << year
    end
    puts @years
    @user = User.find(current_user.id)
    render 'dashboard/search'
  end

  def search
    # get client_id
    @user = User.find(current_user.id)
    @corp = Corp.find_by(name: @user.corp)
    @corp_id = @corp.id

    # get form values
    @record_type = params[:record_type]
    @state = params[:state]
    @jurisdiction_string = params[:jurisdiction_string]
    @jurisdiction_string_options = params[:jurisdiction_string_options]
    @filing_format = params[:filing_format]
    @billing_year = params[:year]
    @billing_month = params[:month]

    if @state.empty?
      @state = "%"
    end

    if @jurisdiction_string.empty?
      @jurisdiction_string = "%"
    end

    if @jurisdiction_string_options.empty?
      @jurisdiction_string_options = "3"
    end

    if @filing_format.empty?
      @filing_format = "BETWEEN 1 AND 4"
    else
      @filing_format = "BETWEEN " + @filing_format + " AND " + @filing_format
    end

    if @billing_month.empty?
      @billing_month = "BETWEEN 1 AND 12"
    else
      @billing_month = 'BETWEEN ' + @billing_month + ' AND ' + @billing_month
    end

    if @billing_year.empty?
      @billing_year = "BETWEEN 1996 AND 2019"
    else
      @billing_year = 'BETWEEN ' + @billing_year + ' AND ' + @billing_year
    end


    if !@jurisdiction_string.empty?
      if @jurisdiction_string_options == "1"
        @jurisdiction_string_query = @jurisdiction_string + '%'
      elsif @jurisdiction_string_options == "2"
        @jurisdiction_string_query = @jurisdiction_string
      elsif @jurisdiction_string_options == "3"
        @jurisdiction_string_query = ('%' + @jurisdiction_string + '%')
      elsif @jurisdiction_string_options == "4"
        @jurisdiction_string_query = '%' + @jurisdiction_string
      end
    else
      @jurisdiction_string_query = "%"
    end

    # connect to database


    # run query
    @results = Record.where(
        "corp_id = ? AND state LIKE ? AND jurisdiction LIKE ? AND filing_format " + @filing_format +
            " AND billing_month " + @billing_month + " AND billing_year " + @billing_year,
        @corp_id,
        @state,
        @jurisdiction_string_query
    )
    puts @results

    # log query in access table
    @query = Query.new
    @query.user_id = @user.id
    @query.corp_id = @corp_id
    @query.results_count = @results.count
    @query_string = {
        "state" => @state,
        "jurisdiction_string_query" => @jurisdiction_string_query,
        "filing_format" => @filing_format,
        "billing_month" => @billing_month,
        "billing_year" => @billing_year
    }
    @query.query_string = (@query_string.to_json)
    @query.save

    # load up results for the view
    results(@results)
  end

  def results (results)
    @records = results
    render 'dashboard/results'
  end

  def upload_index
    render 'dashboard/upload'
  end

  def upload
    # do upload
  end

  def emp
    render 'dashboard/emp'
  end
end
