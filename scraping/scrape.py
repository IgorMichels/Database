from selenium import webdriver
from selenium.webdriver.chrome.options import Options

options = Options()
options.headless = True
options.add_argument("--window-size=1920,1200")
driver = webdriver.Chrome(options=options, executable_path='//bin/chromedriver')

#tailnumbers = [line.rstrip() for line in open('tail_numbers.txt')]
tailnumbers = ['N29975', 'N12142', 'N11106','N223UA']

data = {
    'companys' : set(), # Set of tuples like (name,city,state,country)
    'engine_types' : set(), # Set of engine types
    'aircraft_types' : set(), # Set of aircraft types
    'aircraft_models' : set(), # Set of aircraft models
    'manufacturers' : set(), # Set of Manufacturers
    'aircrafts' : set(), # Set of tuples like (N-Number,Company_name,Airplane_Model,Engine_Type,Aircraft_Type,Year)
}

for aircraft in tailnumbers:
    driver.get("https://registry.faa.gov/aircraftinquiry/NNum_Results.aspx?NNumbertxt="+aircraft)

    data['companys'].add((
        driver.find_element_by_id('ctl00_content_lbOwnerName').text,
        driver.find_element_by_id('ctl00_content_lbOwnerCity').text,
        driver.find_element_by_id('ctl00_content_lbOwnerState').text,
        driver.find_element_by_id('ctl00_content_lbOwnerCountry').text
    ))

    data['engine_types'].add(
        driver.find_element_by_id('ctl00_content_lbTypeEng').text
    )

    data['aircraft_types'].add(
        driver.find_element_by_id('ctl00_content_Label11').text
    )

    data['aircraft_models'].add(
        driver.find_element_by_id('ctl00_content_Label7').text
    )

    data['manufacturers'].add(
        driver.find_element_by_id('ctl00_content_lbMfrName').text
    )

    data['aircrafts'].add((
        aircraft,
        driver.find_element_by_id('ctl00_content_lbOwnerName').text,
        driver.find_element_by_id('ctl00_content_Label7').text,
        driver.find_element_by_id('ctl00_content_lbTypeEng').text,
        driver.find_element_by_id('ctl00_content_Label11').text,
        driver.find_element_by_id('ctl00_content_Label17').text
    ))

print(data)
driver.quit()