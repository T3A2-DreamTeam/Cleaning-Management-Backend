require "test_helper"

class JobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job = jobs(:one)
  end

  test "should get index" do
    get jobs_url, as: :json
    assert_response :success
  end

  test "should create job" do
    assert_difference('Job.count') do
      post jobs_url, params: { job: { address_id: @job.address_id, client_id: @job.client_id, due_date: @job.due_date, job_type_id: @job.job_type_id, reoccuring: @job.reoccuring, reoccuring_length: @job.reoccuring_length, time_in: @job.time_in, time_out: @job.time_out, user_id: @job.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show job" do
    get job_url(@job), as: :json
    assert_response :success
  end

  test "should update job" do
    patch job_url(@job), params: { job: { address_id: @job.address_id, client_id: @job.client_id, due_date: @job.due_date, job_type_id: @job.job_type_id, reoccuring: @job.reoccuring, reoccuring_length: @job.reoccuring_length, time_in: @job.time_in, time_out: @job.time_out, user_id: @job.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy job" do
    assert_difference('Job.count', -1) do
      delete job_url(@job), as: :json
    end

    assert_response 204
  end
end