require_relative "room"

class Hotel
  def initialize(name, capsh)
    @name = name
    @rooms = {}
    capsh.each do |room_name, cap|
        @rooms[room_name] = Room.new(cap)
    end
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(name)
    @rooms.include?(name)
  end

  def check_in(person, room)
    if room_exists?(room)
        checked = self.rooms[room].add_occupant(person) 
        if checked 
            puts "Check in successful" 
        else
            puts "sorry, room is full" 
        end
    else
        puts "sorry, room does not exist"
    end 
  end


  def has_vacancy?
    !rooms.values.all?(&:full?)
  end

  def list_rooms
    @rooms.each do |name, clsobj|
        puts name + " " + clsobj.available_space.to_s
    end
  end
end
