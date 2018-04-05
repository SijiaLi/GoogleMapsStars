# Visualizing Geo Information Saved in Google Maps

After 10+ trips to NYC I feel like I need to create my own NYC vlog in a geek way! So voila, here it is!

<p align="center">
  👣 My Footprint in NYC
</p>

![image](https://user-images.githubusercontent.com/15311750/34636580-ad0fd510-f272-11e7-9b84-dbd0aa233f32.png)





### How to make a similar visualization
1. Get Geo Info
Use [Google Takeout](https://takeout.google.com/) to download information saved in Google Maps.

2. Get a subset of NYC data
The downloaded file is in json format. The script nyc.r cleans the dataset and subset the locations in NYC, then saved the clean nyc data to a file called "data.csv"

3. Convert CSV to GEOJSON
The file csv_to_json.py converts the data to geojson as that's the data type GitHub renders.



Here's the interactive [visualization](https://render.githubusercontent.com/view/geojson?url=https://raw.githubusercontent.com/SijiaLi/GoogleMapsStars/master/nyc.geojson) 💎  enjoy!
