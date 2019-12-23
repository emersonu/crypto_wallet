module ApplicationHelper
  def data_br(data_us)
    data_us.strftime("%d/%m/%Y")
  end

  def ambiente_rails
    if Rails.env.production?
      'produção'
    elsif Rails.env.development?
      'desenvolvimento'
    elsif Rails.env.test?
      'teste'
    else
      'outro'
    end
  end

end

