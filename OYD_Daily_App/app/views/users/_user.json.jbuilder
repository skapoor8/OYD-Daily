json.extract! user, :id, :name, :oyd_id, :access_level, :first_name, :last_name, :def_school, :def_region, :def_nat_area, :auth_schools, :created_at, :updated_at
json.url user_url(user, format: :json)
