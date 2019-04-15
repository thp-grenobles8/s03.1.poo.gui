class User
  attr_accessor :email, :age
  @@all = []

  def initialize (email, age)
    @email = email
    @age = age
    @@all << self
  end

  def self.all
    return @@all
  end

  def self.find_by_email(email)
    return @@all.select {|u| u.email == email}
  end

  def to_s
    return "email : #{@email} \n" +
      "age : #{@age}"
  end

end
