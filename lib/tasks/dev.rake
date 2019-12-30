namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando o Banco") { %x(rails db:drop) }
      show_spinner("Criando o Banco") { %x(rails db:create) }
      show_spinner("Migrando o Banco") { %x(rails db:migrate) }
      %x(rails dev:add_mining_types)
      %x(rails dev:add_coins)
    else
      puts "Você não está em ambiente de desenvolvimento! Preste Atenção!!!"
    end
  end

  desc "Cadastra as moedas"
  task add_coins: :environment do
    show_spinner("Cadastrando Moedas") do
      coins = [
          {
              description: "Bitcoin",
              acronym: "BTC",
              url_image: "http://www.pngall.com/wp-content/uploads/1/Bitcoin-PNG-Pic.png",
              mining_type: MiningType.find_by(acronym: 'PoW')
          },
          {
              description: "Etherium",
              acronym: "ETH",
              url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/256px-Ethereum_logo_2014.svg.png",
              mining_type: MiningType.all.sample
          },

          {
              description: "Dash",
              acronym: "DASH",
              url_image: "https://cdn.freebiesupply.com/logos/large/2x/dash-3-logo-png-transparent.png",
              mining_type: MiningType.all.sample
      }

      ]

      coins.each do |coin|
        Coin.find_or_create_by! coin
      end
    end
  end

  desc "Cadastra os tipos de mineração"
  task add_mining_types: :environment do
    show_spinner("Cadastrando tipos de mineração") do
      mining_types = [
          {description: "Proof of Work", acronym: "PoW" },
          {description: "Proof of Stake", acronym: "PoS" },
          {description: "Proof of Capacity", acronym: "PoC" }
      ]
      mining_types.each do |mining_type|
        MiningType.find_or_create_by! mining_type
      end
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
