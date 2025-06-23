function lilka::update()

    if controller.get_state().a.just_pressed then

        -- Завершуємо програму при натисканні кнопки "A"

        util.exit()

    end

end


function lilka::draw()

    -- Заповнюємо екран чорним кольором:

    display.fill_screen(display.color565(0, 0, 0))


    -- Виводимо текст "Hello, world!" на екран:

    display.set_cursor(0, 32)

    display.print("Hello, world!")

end


