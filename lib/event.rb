require "time"

class Event
  attr_accessor :duration, :name
  attr_reader :start_date, :attendees # pas en accessor
  # pour éviter d'écrire n'importe quoi (pas une date)
  # pour changer la date, passer par la méthode #set_date

  def initialize (date, duration, name, attendees = [])
    begin
      @start_date = Time.parse(date)
      # lance une erreur si la string ne contient pas de date
    rescue
      raise ArgumentError.new(
        "Un évènement a besoin d'une date au format an-mois-jour heure:minute"
      ) # pour que l'erreur soir en francais et explicite
    end

    if !duration.is_a? Integer
      raise ArgumentError.new("il faut une durée en minutes (integer)")
    end
    @duration = duration

    raise ArgumentError.new("il faut un nom en string") if !name.is_a? String
    @name = name

    raise ArgumentError.new("il faut un array d'emails en attendees") if !attendees.is_a? Array
    @attendees = attendees

    puts "nouvel evenement : #{@name} à #{@start_date.strftime("%H:%M:%S %d/%m/%Y")}"
  end

  def postpone_24h
    @start_date += 1*24*60*60
    puts "nouvelle date : #{@start_date.strftime("%H:%M:%S %d/%m/%Y")}"
  end

  def end_date
    end_d =  @start_date + duration*60
    puts "fin :" + (end_d)
  end

  def is_past?
    return Time.now > @start_date
  end

  def is_future?
    return !self.is_past?
  end

  def how_many_more_minutes
    return (@start_date - Time.now)/60
  end

  def is_soon?
    return (how_many_more_minutes).between?(0,30)
  end

  def to_s
    return "Nom : #{@name} \n" +
      "date de début : #{@start_date} \n" +
      "duree : #{@duration*60} \n" +
      "invités : #{@attendees.to_s}"
  end

end
