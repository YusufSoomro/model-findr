json.extract! @user,
              :email,
              :username,
              :password,
              :skill_type,
              :gender,
              :city,
              :about_me,
              :experience,
              :compensation,
              :avatar_img
json.images do
  json.array! @user.images
end
