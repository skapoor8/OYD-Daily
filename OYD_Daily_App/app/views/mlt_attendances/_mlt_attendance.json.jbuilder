json.extract! mlt_attendance, :id, :student_id, :mlt_date, :course, :lesson, :created_at, :updated_at
json.url mlt_attendance_url(mlt_attendance, format: :json)
