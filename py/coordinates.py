# City Coordinates Finder
#
# Author: Matthew McGilvery
# Date: August 3, 2024
# Topic: Geolocation, Geocoding, City Coordinates
#
# Description:
# This script uses the geopy library to find the latitude and longitude coordinates
# of two user-input cities. It demonstrates basic geocoding functionality and error handling.
#
# Keywords: Python, geopy, geocoding, latitude, longitude, coordinates, city location

from geopy.geocoders import Nominatim
from geopy.exc import GeocoderTimedOut, GeocoderUnavailable
import time


def get_coordinates(city_name, max_retries=3):
    # Attempt to get coordinates for a given city name.
    #
    # Args:
    # city_name (str): Name of the city to geocode
    # max_retries (int): Maximum number of retry attempts
    #
    # Returns:
    # tuple: (latitude, longitude) if successful, None otherwise
    
    geolocator = Nominatim(user_agent="city_coordinates_finder")
    for attempt in range(max_retries):
        try:
            location = geolocator.geocode(city_name)
            if location:
                return (location.latitude, location.longitude)
            else:
                print(f"Warning: '{city_name}' not found.")
                return None
        except (GeocoderTimedOut, GeocoderUnavailable):
            if attempt < max_retries - 1:
                print(f"Attempt {attempt + 1} failed. Retrying...")
                time.sleep(1)
            else:
                print(f"Error: Unable to fetch coordinates for '{city_name}' after {max_retries} attempts.")
                return None


def main():
    print("Welcome to City Coordinates Finder!")
    print("This program will find the latitude and longitude of two cities.")
    
    city1 = input("Enter the name of the first city: ")
    city2 = input("Enter the name of the second city: ")

    coords1 = get_coordinates(city1)
    coords2 = get_coordinates(city2)

    if coords1:
        print(f"Coordinates of {city1}: Latitude {coords1[0]:.4f}, Longitude {coords1[1]:.4f}")
    else:
        print(f"Unable to find coordinates for {city1}")

    if coords2:
        print(f"Coordinates of {city2}: Latitude {coords2[0]:.4f}, Longitude {coords2[1]:.4f}")
    else:
        print(f"Unable to find coordinates for {city2}")


if __name__ == "__main__":
    main()
