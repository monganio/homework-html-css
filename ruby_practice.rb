# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password
    def initialize(name, email, password)
        @name = name
        @email = email
        @password = password
    end
end

# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
    attr_accessor :name, :description, :users
    def initialize(name, description)
        @name = name
        @description = description
        @users = []
    end
end

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
end

# add a method to user so, user can enter to a room
# user.enter_room(room)
class User
    def enter_room(room)
        room.add_user(self)
    end
end
class Room
    def add_user(user)
        @users << user
    end
end

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
class User
    def send_message(room, content)
        message = Message.new
        message.user = self
        message.room = room
        message.content = content
        room.broadcast(message)
    end
    def acknowledge_message(room,message)
        puts "#{self.name} received a message in #{room.name} from #{message.user.name}: '#{message.content}'"
    end
end
  

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)
class Room
    def broadcast(message)
        @users.each do |user|
            user.acknowledge_message(self, message)
        end
    end
 end

'''
user_1 = User.new("Monganio", "miao@gmail.com", "1234567890")
user_2 = User.new("Absalomlor", "kung@gmail.com", "9876543210")

cafeteria = Room.new("Cafeteria", "For Hungry People")
tech_room = Room.new("Tech", "This is a tech room")

user_1.enter_room(cafeteria)
user_2.enter_room(cafeteria)

user_1.send_message(cafeteria, "Hi Absalomlor! Have you eaten yet?")
'''