class PetDecorator < Draper::Decorator

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def life_time
    life_time = Date.today - date_of_birth
    lift_time = to_i
  end
end
