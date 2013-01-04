class Ingresso
  def initialize(movie_start_at, room, price)
    @movie_start_at = movie_start_at
    @room = room
    @price = price
  end

  def calculate_discount(birthday, student = false)
    age = calculate_age(birthday)

    return 0 if age < 0

    if age < 5 || age > 65
      @price * 0.8
    elsif student
      case age
      when 6..17  then @price * 0.5
      when 18..25 then @price * 0.25
      when 26..64 then @price * 0.1
      end
    else
      0
    end
  end

  def calculate_age(date)
    years = Date.today.year - date.year
    Date.today < Date.civil(Date.today.year, date.month, date.day) ? years - 1 : years
  end
end