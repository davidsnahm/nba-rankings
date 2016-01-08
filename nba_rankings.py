from bs4 import BeautifulSoup
import urllib.request
import csv
with open("nba_rankings.csv", "w") as o:
	output = csv.writer(o, delimiter=',')
	teams = []
	ranks = []
	years = []
	for year in range(1964, 2016):
		url = "http://www.basketball-reference.com/leagues/NBA_%s_standings.html" % year
		bbFile = urllib.request.urlopen(url)
		fileHtml = bbFile.read()
		bbFile.close()

		soup = BeautifulSoup(fileHtml)
		table = soup.find("table", id="expanded-standings")
		tbody = table.find('tbody')
		rows = tbody.findAll('tr')

		for row in rows:
			cells = row.findAll('td')
			teams.append(cells[1].text)
			ranks.append(int(cells[0].text)*30/len(rows))
			years.append(int(year))
		
	output.writerows([teams])
	output.writerows([ranks])
	output.writerows([years])