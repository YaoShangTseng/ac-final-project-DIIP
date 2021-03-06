namespace :dev do

  task :fake => :environment do

    sex_array = ["男", "女"]
    relation_array = ["單身", "交往中", "已婚"]

    puts "清除資料!!"
    User.destroy_all
    Profile.destroy_all
    Hobby.destroy_all
    Profession.destroy_all
    Mission.destroy_all
    Question.destroy_all
    Location.destroy_all
    Friendship.destroy_all
    Interaction.destroy_all

    puts "建立假資料..."

    puts "建立興趣"
    Hobby.create(name: "籃球")
    Hobby.create(name: "游泳")
    Hobby.create(name: "旅遊")
    Hobby.create(name: "聽音樂")
    Hobby.create(name: "逛街")

    puts "建立專業"
    Profession.create(name: "科技")
    Profession.create(name: "金融")
    Profession.create(name: "醫療")
    Profession.create(name: "服務")
    Profession.create(name: "教育")

    puts "建立任務"
    Mission.create(content: "一起去看電影")
    Mission.create(content: "一起去唱歌")
    Mission.create(content: "一起去郊遊")
    Mission.create(content: "一起去健身房")
    Mission.create(content: "一起去爬山")

    puts "建立問題"
    Question.create(content: "你喜歡哪個歌手", unlock_level: 10)
    Question.create(content: "你喜歡什麼運動", unlock_level: 20)
    Question.create(content: "你討厭吃什麼", unlock_level: 30)
    Question.create(content: "你常去旅遊嗎", unlock_level: 40)
    Question.create(content: "你有養寵物嗎", unlock_level: 50)

    puts "建立地區"
    Location.create(name: "臺北市")
    Location.create(name: "新北市")
    Location.create(name: "桃園市")
    Location.create(name: "臺中市")
    Location.create(name: "臺南市")
    Location.create(name: "高雄市")
    Location.create(name: "基隆市")
    Location.create(name: "新竹市")
    Location.create(name: "嘉義市")
    Location.create(name: "新竹縣")
    Location.create(name: "苗栗縣")
    Location.create(name: "彰化縣")
    Location.create(name: "南投縣")
    Location.create(name: "雲林縣")
    Location.create(name: "嘉義縣")
    Location.create(name: "屏東縣")
    Location.create(name: "宜蘭縣")
    Location.create(name: "花蓮縣")
    Location.create(name: "臺東縣")
    Location.create(name: "澎湖縣")

    puts "建立Avatar"
    Avatar.destroy_all
    Avatar.create(filename: 'man-1.png')
    Avatar.create(filename: 'man-2.png')
    Avatar.create(filename: 'man-3.png')
    Avatar.create(filename: 'man-4.png')
    Avatar.create(filename: 'man-5.png')
    Avatar.create(filename: 'man-6.png')
    Avatar.create(filename: 'man-7.png')
    Avatar.create(filename: 'man-8.png')
    Avatar.create(filename: 'man-9.png')
    Avatar.create(filename: 'woman-1.png')
    Avatar.create(filename: 'woman-2.png')
    Avatar.create(filename: 'woman-3.png')
    Avatar.create(filename: 'woman-4.png')
    Avatar.create(filename: 'woman-5.png')
    Avatar.create(filename: 'woman-6.png')
    Avatar.create(filename: 'woman-7.png')
    Avatar.create(filename: 'woman-8.png')
    Avatar.create(filename: 'woman-9.png')
    Avatar.create(filename: 'woman-10.png')
    Avatar.create(filename: 'woman-11.png')
    Avatar.create(filename: 'woman-12.png')
    Avatar.create(filename: 'woman-13.png')
    Avatar.create(filename: 'woman-14.png')
    Avatar.create(filename: 'woman-15.png')

    puts "建立使用者 & 個人資料"
    user = User.create!(:email => "yakushou730@gmail.com", :password => "000000")
    profile = Profile.create!(:nickname => "Yao-Shang", :user_id => user.id,
                          :age => 18,
                          :sex => "男",
                          :relation => "單身",
                          :description => "Go Go Go",
                          :aboutme => "手牽手一步兩步三步四步望著天",
                          :facebook_link => "https://www.facebook.com/yakushou730",
                          :facebook_access_level => 10,
                          :line_account => "yakushou730",
                          :line_access_level => 20,
                          :wechat_account => "yakushou730",
                          :wechat_access_level => 30,
                          :location_id => 3)

    user = User.create!(:email => "kukushou@gmail.com", :password => "000000")
    profile = Profile.create!(:nickname => "KUKU", :user_id => user.id,
                          :age => 18,
                          :sex => "女",
                          :relation => "單身",
                          :description => "Go Go Go",
                          :aboutme => "手牽手一步兩步三步四步望著天",
                          :facebook_link => "https://www.facebook.com/yakushou730",
                          :facebook_access_level => 10,
                          :line_account => "yakushou730",
                          :line_access_level => 20,
                          :wechat_account => "yakushou730",
                          :wechat_access_level => 30,
                          :location_id => 3)

    5.times do
      Answer.create!(question_id: Faker::Number.between(Question.first.id, Question.last.id),
                     profile_id: profile.id,
                     content: Faker::Lorem.sentence)
    end

    HobbyTag.create!(profile_id: profile.id,
                       hobby_id: Faker::Number.between(Hobby.first.id, Hobby.last.id))
    ProfessionTag.create!(profile_id: profile.id,
                       profession_id: Faker::Number.between(Profession.first.id, Profession.last.id))



    10.times do |i|
      u = User.create!(:email =>  Faker::Internet.email, :password => "000000")
      p = Profile.create!(:nickname => Faker::Name.name,
                          :user_id => u.id,
                          :age => Faker::Number.between(18, 30),
                          :sex => sex_array[Faker::Number.between(0,1)],
                          :relation => relation_array[Faker::Number.between(0,2)],
                          :description => Faker::Lorem.sentence,
                          :aboutme => Faker::Lorem.sentence,
                          :facebook_link => Faker::Internet.url('facebook.com'),
                          :facebook_access_level => Faker::Number.between(0, 100),
                          :line_account => Faker::Name.name,
                          :line_access_level => Faker::Number.between(0, 100),
                          :wechat_account => Faker::Name.name,
                          :wechat_access_level => Faker::Number.between(0, 100),
                          :location_id => Faker::Number.between(Location.first.id, Location.last.id))

      5.times do
        Answer.create!(question_id: Faker::Number.between(Question.first.id, Question.last.id),
                       profile_id: p.id,
                       content: Faker::Lorem.sentence)
      end

      HobbyTag.create!(profile_id: p.id,
                       hobby_id: Faker::Number.between(Hobby.first.id, Hobby.last.id))
      ProfessionTag.create!(profile_id: p.id,
                       profession_id: Faker::Number.between(Profession.first.id, Profession.last.id))
    end

    #puts "建立好友關係"
    # 1=>2 (10), 2=>1 (100)
    # 1=>3 (10), 3=>1 (0)
    # 1=>4 (10), 4=>1 (0)
    #fs1 = Friendship.create!(:user_id => User.first.id, :friend_id => User.first.id + 1, :love_level => 10, :status => "liked")
    #fs2 = Friendship.create!(:user_id => User.first.id+1, :friend_id => User.first.id, :love_level => 100, :status => "liked")
    #fs3 = Friendship.create!(:user_id => User.first.id, :friend_id => User.first.id + 2, :love_level => 10, :status => "liked")
    #fs4 = Friendship.create!(:user_id => User.first.id+2, :friend_id => User.first.id, :love_level => 0, :status => "liked")
    #fs5 = Friendship.create!(:user_id => User.first.id, :friend_id => User.first.id + 3, :love_level => 10, :status => "liked")
    #fs6 = Friendship.create!(:user_id => User.first.id+3, :friend_id => User.first.id, :love_level => 0, :status => "liked")

    #puts "建立任務結果"

    #Interaction.create!(:friendship_id => fs1.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "1-1", :status => "done")
    #Interaction.create!(:friendship_id => fs1.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "1-2", :status => "done")
    #Interaction.create!(:friendship_id => fs1.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "1-3", :status => "done")
    #Interaction.create!(:friendship_id => fs2.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "2-1", :status => "done")
    #Interaction.create!(:friendship_id => fs2.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "2-2", :status => "done")
    #Interaction.create!(:friendship_id => fs2.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "2-3", :status => "done")
    #Interaction.create!(:friendship_id => fs3.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "3-1", :status => "done")
    #Interaction.create!(:friendship_id => fs3.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "3-2", :status => "done")
    #Interaction.create!(:friendship_id => fs3.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "3-3", :status => "done")
    #Interaction.create!(:friendship_id => fs4.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "4-1", :status => "done")
    #Interaction.create!(:friendship_id => fs4.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "4-2", :status => "done")
    #Interaction.create!(:friendship_id => fs4.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "4-3", :status => "done")
    #Interaction.create!(:friendship_id => fs5.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "5-1", :status => "done")
    #Interaction.create!(:friendship_id => fs5.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "5-2", :status => "done")
    #Interaction.create!(:friendship_id => fs5.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "5-3", :status => "done")
    #Interaction.create!(:friendship_id => fs6.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "6-1", :status => "done")
    #Interaction.create!(:friendship_id => fs6.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "6-2", :status => "done")
    #Interaction.create!(:friendship_id => fs6.id, :mission_id => Faker::Number.between(Question.first.id, Question.last.id), :comment => "6-3", :status => "done")

    #puts "---LOG---"
    #puts "Create User id from #{User.first.id} to #{User.last.id}"
    #puts "Create Profile id from #{Profile.first.id} to #{Profile.last.id}"

  end

end