# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#prints out strings you can use to create images
def image_maker(user, img_url_arr)
  img_url_arr.each do |img_url|
    puts "Image.create!(user_id: #{user.id}, img_url: #{img_url}, user_city: #{user.city})"
  end
end

def image_like_maker(image_id, user_id)
  ImageLike.create!(image_id: image_id, user_id: user_id)
end

# EXPLORE BASED USERS
mario = User.create!(
  email: "mariotestino19@gmail.com",
  username: "Testino",
  password: "password19",
  skill_type: "Photographer",
  gender: "Male",
  city: "San Leandro, CA, United States",
  about_me: "My work has been featured in magazines such as Vogue and Vanity
    Fair. My career highpoint came in 1997 when I was chosen by Princess Diana
    of Wales to photograph her for Vanity Fair. I've been regularly employed by
    the British royal family ever since.",
  experience: "Lots",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/vsen4QYfTZy434bWWNbN"
)
bruce = User.create!(
  email: "bruceweber19@gmail.com",
  username: "Webs",
  password: "password19",
  skill_type: "Photographer",
  gender: "Male",
  city: "Santa Barbara, CA, United States",
  about_me: "I am most widely known for my ad campaigns for Calvin Klein, Ralph
    Lauren, Pirelli, Abercrombie & Fitch, Revlon, and Gianni Versace, as well as
    my work for Vogue, GQ, Vanity Fair, Elle, Life, Interview, and Rolling Stone
    magazines.",
  experience: "Lots",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/UYFIIQuePCu2omhuqwTj"
)
adam = User.create!(
  email: "adamgallagher19@gmail.com",
  username: "iamgalla",
  password: "password19",
  skill_type: "Model",
  gender: "Male",
  city: "Los Angeles, CA, United States",
  about_me: "My name is Adam Michael Gallagher. I'm 18 years young, a libra
    obsessed with fashion & styling and living in Riverside, California. I went
    to school at my community college and it just wasn't fit for me. So now I'm
    currently involved in fashion and trying to make the best of it.",
  experience: "Lots",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/n6rjMIoSsCPm5u4fS3jm"
)
mikki = User.create!(
  email: "mikkikoomar19@gmail.com",
  username: "Mikki",
  password: "password19",
  skill_type: "Model",
  gender: "Male",
  city: "Davis, CA, United States",
  about_me: "I'm an upcoming bollywood actor and former model. My name is Mikki
    Koomar and I recently signed my upcoming bollywood debut film with Cosmic
    Pixcel Production. I am known as the MK in the Indian film industry
    (bollywood). I've changed the spelling of my full name from ‘Mickey Kumar’ to
    ‘Mikki Koomar’. In accordance with numerology, I was born on February 20th in
    Mumbai and brought Up In Mumbai, Maharashtra (India). I am a Cosine Brother
    of film editor & director Santosh Kumar, and formal brother of film producer
    Mr Raajeev Oza",
  experience: "Lots",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/dC5uzihqRZCIUgDdZnnx"
)
scarjo = User.create!(
  email: "scarlettjohansen19@gmail.com",
  username: "ScarJo",
  password: "password19",
  skill_type: "Model",
  gender: "Female",
  city: "Dublin, CA, United States",
  about_me: "I'm a longtime actor that has won many awards. I've been told all
  my life that I am beautiful, so I've always done some modeling from ever since
  I started acting. I figured it was time to get an account on this website
  since it has been growing more and more popular. I've landed many gigs on here
  :)",
  experience: "Lots",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/CIckhJPiTbaLLAYFcazJ"
)
scott = User.create!(
  email: "scotteastwood19@gmail.com",
  username: "NotClintEastwood",
  password: "password19",
  skill_type: "Model",
  gender: "Male",
  city: "Santa Cruz, CA, United States",
  about_me: "My full name is Scott Clinton Reeves Eastwood. I'm American actor
    and model. I am also the son of actor-director Clint Eastwood.",
  experience: "Lots",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/ZSDVHQRZTd26SoX8uyiy"
)


# YOUR CITY BASED USERS, FOR THE GUEST.
juergen = User.create!(
  email: "juergenteller19@gmail.com",
  username: "TheTeller",
  password: "password19",
  skill_type: "Photographer",
  gender: "Male",
  city: "San Francisco, CA, United States",
  about_me: "My name is Jürgen Teller and I was born January 28, 1964. I am a
    German artist and fine-art and fashion photographer.",
  experience: "Some",
  compensation: "Depends on Assignment",
  avatar_img: "https://www.filepicker.io/api/file/DTFUhYhFSpGUVvfznt0S"
)
terry = User.create!(
  email: "terryrichardson19@gmail.com",
  username: "NotGoodkind",
  password: "password19",
  skill_type: "Photographer",
  gender: "Male",
  city: "San Francisco, CA, United States",
  about_me: "I am Terrence 'Terry' Richardson and I was born August 14, 1965. I
    am an American fashion and portrait photographer who has shot advertising
    campaigns for Marc Jacobs, Aldo, Supreme, Sisley, Tom Ford, and Yves Saint
    Laurent among others. I have also done work for magazines such as Rolling
    Stone, GQ, Vogue, Vanity Fair, Harper's Bazaar, i-D, and Vice.",
  experience: "Some",
  compensation: "Depends on Assignment",
  avatar_img: "https://www.filepicker.io/api/file/SpH5pllhQduVKXTNFMYg"
)
godfrey = User.create!(
  email: "godfreygao19@gmail.com",
  username: "Gao",
  password: "password19",
  skill_type: "Model",
  gender: "Male",
  city: "San Francisco, CA, United States",
  about_me: "I'm just on here for fun :)",
  experience: "None",
  compensation: "None",
  avatar_img: "https://www.filepicker.io/api/file/PgCBWCvsT12D2YuTvoDI"
)
kylie = User.create!(
  email: "kyliejenner19@gmail.com",
  username: "ImSoKylie",
  password: "password19",
  skill_type: "Model",
  gender: "Female",
  city: "San Francisco, CA, United States",
  about_me: "I like modeling, lol.",
  experience: "Some",
  compensation: "Required",
  avatar_img: "https://www.filepicker.io/api/file/dqYe85ySRtuiul2TOoAO"
)
lupita = User.create!(
  email: "lupitanyongo19@gmail.com",
  username: "YoureNyong",
  password: "password19",
  skill_type: "Model",
  gender: "Female",
  city: "San Francisco, CA, United States",
  about_me: "I was in the saddest movie ever.",
  experience: "None",
  compensation: "Depends on Assignment",
  avatar_img: "https://www.filepicker.io/api/file/99WXkzDTZe9UhVghpqyQ"
)


#MARIO TESTINO'S IMAGES
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/5BglRgiTfuMJrrcCdPza", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/0yEVHEo1TyuBEtNUCror", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/DC6GOvVMT326PMziitNV", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/UVMyexW1RWCPFjULTeHI", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/DR1S9jX1R9CQldJVOjzN", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/6LtuTA1bQO2RQQkAD7qx", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/MQ6QQS7SeWX10pwiVbvt", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/iV1yr9HRpGRRtC8kGkFD", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/da2VxMgARSq4ovcYE1Mb", user_city: "San Leandro, CA, United States")
Image.create!(user_id: mario, img_url: "https://www.filepicker.io/api/file/oLJWqGuYQVKBnuGb4pk4", user_city: "San Leandro, CA, United States")

#BRUCE WEBER'S IMAGES
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/kj4T15J7ReeVR16J4QnK", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/3JIk2VTOQa2LJYAJaCPt", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/6MbBzE0wQJqrOHNMnYCW", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/tcB7SK6VSgiEB4tW8ZpH", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/UYFIIQuePCu2omhuqwTj", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/AJyCei1S9uk9x4cR3VPc", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/ykPyszLuRFusFxOI6Xs8", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/1LwvnPT4CuC5AH6mFUlA", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/gXZEUqGQDKXXuHs3rvwm", user_city: "Santa Barbara, CA, United States")
Image.create!(user_id: bruce, img_url: "https://www.filepicker.io/api/file/QhDE7VFNTOK3uGc0Ruzc", user_city: "Santa Barbara, CA, United States")

#ADAM GALLAGHER'S IMAGES
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/brQ0Wa7SYitsUKrI5XjA", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/9tRm2WY1TAapCmodhdd9", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/sdkKyG69ToikBWy7KyWl", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/QrsuIWSjS8KtpWTUpNcd", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/bvekoxhLQmbsoyLbpYD9", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/GikJwGOQjGnehJ80yqli", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/EEQUUrjQS2eRKUx7lrv3", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/idhcPF3QlKx2oLupxuN8", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/n6rjMIoSsCPm5u4fS3jm", user_city: "Los Angeles, CA, United States")
Image.create!(user_id: adam, img_url: "https://www.filepicker.io/api/file/ZmjNyRYJSlWdYjQahkDK", user_city: "Los Angeles, CA, United States")

#MIKKI KOOMAR'S IMAGES
Image.create!(user_id: mikki, img_url: "https://www.filepicker.io/api/file/CbMqBpTr656CQuKquHug", user_city: "Davis, CA, United States")
Image.create!(user_id: mikki, img_url: "https://www.filepicker.io/api/file/66y3H97WQ4iYurgM5SiX", user_city: "Davis, CA, United States")
Image.create!(user_id: mikki, img_url: "https://www.filepicker.io/api/file/nLq6wwUCQJWM69xDcrjv", user_city: "Davis, CA, United States")
Image.create!(user_id: mikki, img_url: "https://www.filepicker.io/api/file/cne5dD5QCetY27um0eYY", user_city: "Davis, CA, United States")
Image.create!(user_id: mikki, img_url: "https://www.filepicker.io/api/file/dC5uzihqRZCIUgDdZnnx", user_city: "Davis, CA, United States")

#SCARLET JOHANSEN'S IMAGES
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/nnUEWNHHT7GTiHfcTK80", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/FAyoxyEESTGr2zhLtMXD", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/pXHyxBA4R3qFyuaR9biU", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/poqXO9ZJQaKCYqKqOW9F", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/CIckhJPiTbaLLAYFcazJ", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/jygAuMqQgGzmwyfyStjU", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/uLGmuXlrSgi7iH2WKEBW", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/OxjmiqUS9aZIZdlzaCwJ", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/ymr52ZLASimVIcArZPWd", user_city: "Dublin, CA, United States")
Image.create!(user_id: scarjo, img_url: "https://www.filepicker.io/api/file/bsqd55zNS0emq6ccD51y", user_city: "Dublin, CA, United States")

#SCOTT EASTWOOD'S IMAGES
Image.create!(user_id: scott, img_url: "https://www.filepicker.io/api/file/ZSDVHQRZTd26SoX8uyiy", user_city: "Santa Cruz, CA, United States")
Image.create!(user_id: scott, img_url: "https://www.filepicker.io/api/file/yaHNhgTISAmORPDBYEGE", user_city: "Santa Cruz, CA, United States")
Image.create!(user_id: scott, img_url: "https://www.filepicker.io/api/file/KVSp2s2qT0igLAs5FnPY", user_city: "Santa Cruz, CA, United States")
Image.create!(user_id: scott, img_url: "https://www.filepicker.io/api/file/EeXmNa0VQ96IQ3gva6gn", user_city: "Santa Cruz, CA, United States")
Image.create!(user_id: scott, img_url: "https://www.filepicker.io/api/file/qRPvUrk5TgeiogmnR1g6", user_city: "Santa Cruz, CA, United States")

#JUERGEN TELLER'S IMAGES
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/uwUfrdQ1fIvMaUc0jpg6", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/9ZuhF1BpSbSBAS1V9Ws5", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/USMqzYpNRoS6j2ZHThM2", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/hBrqbKJ5Q6GpT6phbmwL", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/K3UYG36bTfqmWH1qI3nH", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/7qn3qsRRMCIPqF6L8ivn", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/pX1nas0BTwocUdHOnsqg", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/DTFUhYhFSpGUVvfznt0S", user_city: "San Francisco, CA, United States")
Image.create!(user_id: juergen, img_url: "https://www.filepicker.io/api/file/IjdbbcVoSKOaxBXwn6D9", user_city: "San Francisco, CA, United States")

#TERRY RICHARDSON'S IMAGES
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/twbtKpmFQPGNWt8rsZ4Y", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/UJUucH9ARBG3pUzlR5mA", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/z5PyzGFTTdey1TdzMMtP", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/gcGMc0UjQhOdF9C6T1dx", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/AtW1QvQ5W32Wi2ed2wtd", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/cHtxUBbsRpSK2vZc6GwX", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/LsguyZZQ1WzuAnX31JNW", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/IPHaZQzTTk6B3g7sGpk8", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/C5j895HmQeOnbKd9eK6p", user_city: "San Francisco, CA, United States")
Image.create!(user_id: terry, img_url: "https://www.filepicker.io/api/file/yJKaaOyTzGFWjzVKbpZi", user_city: "San Francisco, CA, United States")

#GODFREY GAO'S IMAGES
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/A6iw8fyWR06AMzmkzxZe", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/5p071c4RRHGNOaz5uLxu", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/gyC0aOohSimMAp0Mw5nA", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/nEamvuvjQbucBOZId10M", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/3bTWKDG7SVa1aAOxS9t3", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/SPx3bxqTH6amB1KJ3PN8", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/PgCBWCvsT12D2YuTvoDI", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/kFg0fAq1RiaqSk38GQlj", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/BzpLqSdfRcqr2gpplRk0", user_city: "San Francisco, CA, United States")
Image.create!(user_id: godfrey, img_url: "https://www.filepicker.io/api/file/V9wTMR9jR1KWSBWmqIgF", user_city: "San Francisco, CA, United States")

#KYLIE JENNER'S IMAGES
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/QJGJn7XtSBCXHsKCOnYd", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/x7e4gzQ2SgiJpDOQnA4q", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/EbmQujgRsiiSYmEnXYig", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/RygFuuOyQVmRMw5g1b3V", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/MiUNXDTOTiKY3SJcccQy", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/2tcDoYPbRvS8X0YaNiQ2", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/Uz15jOLTT5CIKLDa0ORC", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/yJqVdYleSYebv7rwsWEW", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/P0CV0LktTsq4nYvFlT6Z", user_city: "San Francisco, CA, United States")
Image.create!(user_id: kylie, img_url: "https://www.filepicker.io/api/file/dqYe85ySRtuiul2TOoAO", user_city: "San Francisco, CA, United States")

#LUPITA NYONG'O'S IMAGES
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/uM3awngWRmlref1jxOA6", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/0aj9VqRiCJJVzXH7Aptv", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/99WXkzDTZe9UhVghpqyQ", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/3V1APOO2TT2jKUcEa4Zn", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/wrLzc8TNRbOuJds7EZo3", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/c4XE0LaNQHe0pDAmrgxr", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/jKdJT46SbOYFhzC7gFkt", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/8zhyjcQrqzm89JQa8VLQ", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/DpWTi4LLQEx6GsKBzYbA", user_city: "San Francisco, CA, United States")
Image.create!(user_id: lupita, img_url: "https://www.filepicker.io/api/file/dQxJKG5lS3eGw9IWW8d8", user_city: "San Francisco, CA, United States")

User.all.each do |user|
  User.first(6).each do |exp_user|
    exp_user.images.each do |img|
      ImageLike.create!(image_id: img.id, liker_id: user.id)
      UserView.create!(user_id: exp_user.id)
    end
  end
end
