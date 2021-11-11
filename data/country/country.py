class Country:
    def __init__(self, countryName, countryCode, newConfirmed, totalConfirmed, newDeaths, totalDeaths, newRecovered, totalRecovered, date):
        self.countryName = countryName
        self.countryCode = countryCode
        self.newConfirmed = newConfirmed
        self.totalConfirmed = totalConfirmed
        self.newDeaths = newDeaths
        self.totalDeaths = totalDeaths
        self.newRecovered = newRecovered
        self.totalRecovered = totalRecovered
        self.date = date