#!/usr/bin/python3
import json
from country.country import Country
from datetime import datetime, timezone
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore



def main():
    cred = credentials.Certificate("covid-tracker-f7e16-firebase-adminsdk-sf3np-7c1b236bc3.json")
    firebase_admin.initialize_app(cred, {
        'projectId': "covid-tracker-f7e16",
    })

    db = firestore.client()
    file = open("countryData.json", "r")
    data = json.load(file)

    print(db)

    for country in data['Countries']:
        #countryData = Country()
        time = country["Date"].split("T")
        date = time[0].split("-")
        hour = time[1].split(":")
        seconds = hour[2].split(".")

        dateTime = datetime(int(date[0]), int(date[1]), int(date[2]), int(hour[0]), int(hour[1]), int(seconds[0]))
        timeStamp = datetime.timestamp(dateTime)

        data = {
            u'countryCode': country["CountryCode"],
            u'countryName': country["Country"],
            u'newConfirmed': country["NewConfirmed"],
            u'totalConfirmed': country["TotalConfirmed"],
            u'newDeaths': country["NewDeaths"],
            u'totalDeaths': country["TotalDeaths"],
            u'newRecovered': country["NewRecovered"],
            u'totalRecovered': country["TotalRecovered"],
            u'date': timeStamp
        }
        db.collection(u'stats').document(country["Country"]).set(data)

    file.close()


if __name__ == '__main__':
    main()
