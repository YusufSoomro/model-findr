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
  json.array! @user.images do |image|
    json.extract! image, :id, :user_id, :img_url, :caption, :user_city
    json.liked image.liked_by_user?(@user)
    json.author_username @user.username
    json.num_likes image.image_likes.length
  end
end
