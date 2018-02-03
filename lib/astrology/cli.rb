class Astrology::Cli

  def call
    @headline = Astrology::Scraper.scrape_kcstar
    list_horoscopes
    menu
    goodbye
  end

  def list_horoscopes
    puts "Welcome to Astrology Gem!"
    puts "Enter a number 1-12 to view your daily horoscope"
    puts "**************************************************"
    puts printf("%39s", "Horoscope Sign & Birthdate Range")
    puts "--------------------------------------------------"
    Astrology::Horoscope.all.each.with_index(1) do |horoscope, i|
      puts "#{sprintf("%3d", i)}.  #{horoscope.name.ljust(15)} #{horoscope.dates}"
    end
  end

  def menu
    input = nil
    while input != "exit"

      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 13
        horoscope = Astrology::Horoscope.all[input.to_i - 1]
        puts "**************************************************"
        puts printf("%44s", @headline)
        puts "--------------------------------------------------"
        puts printf("%25s", horoscope.name)
        puts " "
        puts horoscope.summary
        puts " "
        puts "Lucky Number:  #{horoscope.lucky_number}"
        puts " "
        puts "Financial Outlook:  #{horoscope.financial_outlook}"
        puts " "
        puts "Partner Compatibility:  #{horoscope.compatible_sign}"
        puts " "
        puts "Type 'list' to see the list of signs again."
        puts "Type 'exit' if you are done for the day!"

      elsif input.to_i > 12
        puts "Please enter a valid number for a Horoscope."


      elsif input == "list"
        list_horoscopes
      else
        puts "Not sure what you are looking for."
        puts "Type 'list', 'exit', or make a valid selection."
      end
    end
  end

  def goodbye
    puts "Check back again for your daily horoscope!"
  end

end
