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
      discount = 0.8
    elsif student
      discount = case age
      when 6..17  then 0.5
      when 18..25 then 0.25
      when 26..64 then 0.1
      end
    else
      discount = 0
    end

    if @movie_start_at.hour <= 15
      discount = discount + 0.1
    end

    discount * @price
  end

  def calculate_age(date)
    years = Date.today.year - date.year
    Date.today < Date.civil(Date.today.year, date.month, date.day) ? years - 1 : years
  end
end