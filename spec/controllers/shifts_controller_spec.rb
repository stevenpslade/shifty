require "rails_helper"

RSpec.describe ShiftsController do

  describe "GET index" do

    it "should get index" do
      shift = Shift.new
      get :index
      expect(response).to be_success
    end

    it "populates an array of shifts" do
      shift_one = Shift.create(start_date: Date.today, day_shift: true, pending: false)
      get :index
      expect(assigns(:shifts)).to eq([shift_one])
    end

    it "groups shifts by start_date" do
      shifts = Array.new

      shift_one = Shift.create(start_date: Date.today, day_shift: true, pending: false)
      shift_two = Shift.create(start_date: Date.today, day_shift: true, pending: false)
      shift_three = Shift.create(start_date: Date.today + 3, day_shift: true, pending: false)

      shifts.push(shift_one, shift_two, shift_three)
      shifts = shifts.group_by(&:start_date)

      get :index
      expect(assigns(:shifts_by_date)).to eq(shifts)
    end

    describe "@date" do

      context "when no date param is given" do
        it "is today's date" do
          today = Date.today

          get :index
          expect(assigns(:date)).to eq(today)
        end
      end

      context "when a date params is given" do
        it "is the date given" do
          date = Date.today.next_month

          get :index, date: date
          expect(assigns(:date)).to eq(date)
        end
      end

    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end

  end
end