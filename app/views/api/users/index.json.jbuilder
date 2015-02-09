json.array! @users do |user|
  json.extract! user, :id,
                      :email,
                      :username,
                      :skill_type,
                      :gender,
                      :city,
                      :experience,
                      :compensation,
                      :avatar_img
  json.num_views user.user_views.length
end
