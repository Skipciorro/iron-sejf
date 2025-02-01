Config = {}
Config.CooldownTime = 5 * 60 * 1000
Config.Cooldown = {
    Time = 'Napad jest na cooldownie ! Pozostały czas: '
}
Config.Zones = {
    Location = {
        t1 = vector3(-635.0120, -233.9981, 37.9416),
        t2 = vector3(-631.3312, -230.0767, 38.0571),
        t3 = vector3(-622.4236, -229.8262, 38.0570),
----------------------- Loot Zones --------------------------------
        t4 = vector3(-624.6295, -230.9292, 38.0570),
        t5 = vector3(-623.1326, -233.0008, 38.0570),
        t6 = vector3(-625.9444, -234.8160, 38.0570),
        t7 = vector3(-625.7432, -237.7925, 38.0570),
        t8 = vector3(-628.2828, -234.0326, 38.0570),
        t9 = vector3(-624.5735, -227.6557, 38.0570),
        t10 = vector3(-620.3635, -226.8047, 38.0570),
        t11 = vector3(-617.8729, -230.2253, 38.0570),
        t12 = vector3(-619.5617, -233.8700, 38.0570),
    },
    rotation = 0.0,
    Name = {
        t1 = 'hackfirst',
        t2 = 'hacksecond',
        t3 = 'hackthird',
        t4 = 'loot1',
        t5 = 'loot2',
        t6 = 'loot3',
        t7 = 'loot4',
        t8 = 'loot5',
        t9 = 'loot6',
        t10 = 'loot7',
        t11 = 'loot8',
        t12 = 'loot9',
    },
    Icon = {
        t1 = 'fas fa-gem',
        t2 = 'fas fa-shield-alt',
        t3 = 'fas fa-gem',
        t4 = 'fas fa-star',
        t5 = 'fas fa-star',
        t6 = 'fas fa-star',
        t7 = 'fas fa-star',
        t8 = 'fas fa-star',
        t9 = 'fas fa-star',
        t10 = 'fas fa-star',
        t11 = 'fas fa-star',
        t12 = 'fas fa-star',
    },
    Label = {
        t1 = 'Złam zabezpieczenie',
        t2 = 'Wyłącz kamery',
        t3 = 'Złam zabezpieczenie',
        tx = 'Zbierz łup',
    }

}

Config.OX = {
    Duration = {
        first = 10000,
    },
    Label = {
        first = 'Łamanie zabezpieczenia',
        second = 'Łamanie zabezpieczenia',
    },
    Desc = {
        first = 'Anulowano łamanie zabezpieczenia',
        second = 'Anulowano łamanie zabezpieczenia',
        success = 'Zabezpieczenie złamane , udaj się do kolejnego !',
        error = 'Nie udało się złamać zabezpieczenia, spróbuj ponownie !',
        errorgame = 'Wszystkie proby wykorzystane ! Wróć za jakiś czas !',
        hack1 = 'Musisz złamać zabezpieczenie główne !',
        hack2 = 'Musisz wyłączyć kamery !',
        noItem = 'Nie posiadasz odpowiedniego sprzętu !',
        errorprog = 'Anulowano łamanie zabezpieczenia !',
    }
}
Config.Reward = {
    item1 = "gold",
    item2 = "hacking_computer",
    min1 = 5,
    min2 = 8,
    max1 = 10,
    max2 = 12
}
Config.Animation = {
    dict1 = "anim@heists@prison_heistig1_p1_guard_checks_bus",
    name1 = "loop",
    dict2 = "anim@heists@prison_heistig1_p1_guard_checks_bus",
    name2 = "loop",
    dict3 = "anim@heists@prison_heistig1_p1_guard_checks_bus",
    name3 = "loop",
    ldict1 = "amb@world_human_hammering@male@base",
    lname1 = "base",
}

Config.Loot = {
    Item = {
        one = "gold",
        two = "gold",
        three = "gold",
        four = "gold",
        five = "gold",
        six = "gold",
    },
    Message = {
        noLoot = 'Niestety nic nie znalazłeś/łaś !',
        looted = 'Już zebrałeś łup z tej gabloty !',
    }
}