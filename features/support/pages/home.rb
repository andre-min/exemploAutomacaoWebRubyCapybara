

class HomePage
    include Capybara::DSL

    def open
        visit 'https://starbugs-qa.vercel.app/' # 'https://starbugs.vercel.app/'
    end

    def coffee_list
        return all('.coffee-item')
    end

    def buy(coffe_name)
        product = find('.coffee-item', text: coffe_name)
        product.find('.buy-coffee').click
    end

end