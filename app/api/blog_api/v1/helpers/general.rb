module BlogApi::V1::Helpers::General
  extend Grape::API::Helpers
  def declared_params
    declared(params, include_missing: false)
  end
end
