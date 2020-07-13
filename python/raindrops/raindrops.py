def convert(number):

    raintext = "" if number % 3 > 0 else "Pling"

    if number % 5 == 0: raintext += "Plang"

    if number % 7 == 0: raintext += "Plong"

    return str(number) if raintext == "" else raintext

