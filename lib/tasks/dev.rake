namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o Banco") { %x(rails db:drop) }

      show_spinner("Criando o Banco") { %x(rails db:create) }

      show_spinner("Migrando o Banco") { %x(rails db:migrate) }

      show_spinner("Populando o Banco") { %x(rails db:seed) }

    else
      puts "Você não está em ambiente de desenvolvimento! Preste Atenção!!!"
    end
  end

  private

  def show_spinner(msg_start, msg_end = 'Concluído!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start} ....")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end
end
