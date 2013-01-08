require File.expand_path('../../ingresso', __FILE__)
require 'date'

describe Ingresso do
  before do
    movie_start_at = Time.new(2013, 1, 5, 20, 0)
    room = 10
    price = 20.00

    @ingresso = Ingresso.new(movie_start_at, room, price)
  end

  describe '#calculate_discount' do
    context 'when customer has 3 years old' do
      it 'returns a 80% discount' do
        three_years_ago = Date.today.year - 3
        customer_birthday = Date.new(three_years_ago, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(16)
      end
    end

    context 'when customer has 5 years old' do
      it 'returns an empty discount' do
        five_years_ago = Date.today.year - 5
        customer_birthday = Date.new(five_years_ago, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(0)
      end
    end

    context 'when customer has 7 years old' do
      it 'returns an empty discount' do
        seven_years_ago = Date.today.year - 7
        customer_birthday = Date.new(seven_years_ago, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(0)
      end
    end

    context 'when customer has 60 years old' do
      it 'returns an empty discount' do
        sixty_years_ago = Date.today.year - 60
        customer_birthday = Date.new(sixty_years_ago, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(0)
      end
    end

    context 'when customer has 65 years old' do
      it 'returns an empty discount' do
        sixty_five_years_ago = Date.today.year - 65
        customer_birthday = Date.new(sixty_five_years_ago, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(0)
      end
    end

    context 'when customer has 70 years old' do
      it 'returns a 80% discount' do
        seventy_years_ago = Date.today.year - 70
        customer_birthday = Date.new(seventy_years_ago, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(16)
      end
    end

    context 'when customer was not born yet' do
      it 'returns an empty discount' do
        five_years_from_now = Date.today.year + 5
        customer_birthday = Date.new(five_years_from_now, 1, 1)

        discount = @ingresso.calculate_discount(customer_birthday)

        expect(discount).to eq(0)
      end
    end

    context 'when customer is a student' do
      context 'when customer has between 6 and 17 years old' do
        it 'returns a 50% discount' do
          ten_years_ago = Date.today.year - 10
          customer_birthday = Date.new(ten_years_ago, 1, 1)

          discount = @ingresso.calculate_discount(customer_birthday, true)

          expect(discount).to eq(10)
        end
      end

      context 'when customer has between 18 and 25 years old' do
        it 'returns a 25% discount' do
          twenty_years_ago = Date.today.year - 20
          customer_birthday = Date.new(twenty_years_ago, 1, 1)

          discount = @ingresso.calculate_discount(customer_birthday, true)

          expect(discount).to eq(5)
        end
      end

      context 'when customer has between 26 and 64 years old' do
        it 'returns a 10% discount' do
          thirty_years_ago = Date.today.year - 30
          customer_birthday = Date.new(thirty_years_ago, 1, 1)

          discount = @ingresso.calculate_discount(customer_birthday, true)

          expect(discount).to eq(2)
        end
      end

      context 'when the movie starts before 16 hours' do
        before do
          movie_start_at = Time.new(2013, 1, 5, 15, 0)
          room = 10
          price = 20.00

          @ingresso = Ingresso.new(movie_start_at, room, price)
        end

        it 'returns a 10% discount' do
          thirty_years_ago = Date.today.year - 30
          customer_birthday = Date.new(thirty_years_ago, 1, 1)

          discount = @ingresso.calculate_discount(customer_birthday, false)

          expect(discount).to eq(2)
        end

        context 'when customer has 3 years old' do
          it 'returns a 90% discount' do
            three_years_ago = Date.today.year - 3
            customer_birthday = Date.new(three_years_ago, 1, 1)

            discount = @ingresso.calculate_discount(customer_birthday, false)

            expect(discount).to eq(18)
          end
        end

        context 'when customer has 5 years old' do
          it 'returns a 10% discount' do
            five_years_ago = Date.today.year - 5
            customer_birthday = Date.new(five_years_ago, 1, 1)

            discount = @ingresso.calculate_discount(customer_birthday, false)

            expect(discount).to eq(2)
          end
        end

        context 'when customer has 7 years old' do
          it 'returns a 10% discount' do
            seven_years_ago = Date.today.year - 7
            customer_birthday = Date.new(seven_years_ago, 1, 1)

            discount = @ingresso.calculate_discount(customer_birthday, false)

            expect(discount).to eq(2)
          end
        end

        context 'when customer has 60 years old' do
          it 'returns a 10% discount' do
            sixty_years_ago = Date.today.year - 60
            customer_birthday = Date.new(sixty_years_ago, 1, 1)

            discount = @ingresso.calculate_discount(customer_birthday, false)

            expect(discount).to eq(2)
          end
        end

        context 'when customer has 65 years old' do
          it 'returns a 10% discount' do
            sixty_five_years_ago = Date.today.year - 65
            customer_birthday = Date.new(sixty_five_years_ago, 1, 1)

            discount = @ingresso.calculate_discount(customer_birthday, false)

            expect(discount).to eq(2)
          end
        end

        context 'when customer has 70 years old' do
          it 'returns a 90% discount' do
            years_ago = Date.today.year - 70
            customer_birthday = Date.new(years_ago, 1, 1)

            discount = @ingresso.calculate_discount(customer_birthday, false)

            expect(discount).to eq(18)
          end
        end

        context 'when customer is a student' do
          context 'when customer has between 6 and 17 years old' do
            it 'returns a 60% discount' do
              years_ago = Date.today.year - 14
              customer_birthday = Date.new(years_ago, 1, 1)

              discount = @ingresso.calculate_discount(customer_birthday, true)

              expect(discount).to eq(12)
            end
          end

          context 'when customer has between 18 and 25 years old' do
            it 'returns a 35% discount' do
              years_ago = Date.today.year - 20
              customer_birthday = Date.new(years_ago, 1, 1)

              discount = @ingresso.calculate_discount(customer_birthday, true)

              expect(discount).to eq(7)
            end
          end

          context 'when customer has between 26 and 64 years old' do
            it 'returns a 20% discount' do
              years_ago = Date.today.year - 30
              customer_birthday = Date.new(years_ago, 1, 1)

              discount = @ingresso.calculate_discount(customer_birthday, true)

              expect(discount).to eq(4)
            end
          end
        end
      end
    end
  end
end