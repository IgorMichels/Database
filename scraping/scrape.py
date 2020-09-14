from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from time import time

options = Options()
options.headless = True
options.add_argument("--window-size=1920,1200")
driver = webdriver.Chrome(options=options, executable_path='//bin/chromedriver')

tailnumbers = [line.rstrip() for line in open('tail_numbers.txt')]
#tailnumbers = ['N29975', 'N12142', 'N11106','N223UA','N7705A']

f=open('failure.txt','w')

data = {
    'companies' : set(), # Set of tuples like (name,city,state,country)
    'engine_types' : set(), # Set of engine types
    'aircraft_types' : set(), # Set of aircraft types
    'aircraft_models' : set(), # Set of aircraft models
    'manufacturers' : set(), # Set of Manufacturers
    'aircrafts' : set(), # Set of tuples like (N-Number,Company_name,Airplane_Model,Engine_Type,Aircraft_Type,Year)
}

qtd=len(tailnumbers)
t0=time()
for aircraft in range(qtd):
    try:
        driver.get("https://registry.faa.gov/aircraftinquiry/NNum_Results.aspx?NNumbertxt="+tailnumbers[aircraft])
        print('Processing: '+tailnumbers[aircraft]+"     OK     "+str(aircraft)+' de '+str(qtd+1)+' - '+'{:.2f} %'.format(aircraft*100/qtd)+'     {:.2f} s'.format(time()-t0))
        data['companies'].add((
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

        data['aircraft_models'].add((
            driver.find_element_by_id('ctl00_content_lbMfrName').text,
            driver.find_element_by_id('ctl00_content_Label7').text
        ))

        data['manufacturers'].add(
            driver.find_element_by_id('ctl00_content_lbMfrName').text
        )

        data['aircrafts'].add((
            tailnumbers[aircraft],
            driver.find_element_by_id('ctl00_content_lbOwnerName').text,
            driver.find_element_by_id('ctl00_content_Label7').text,
            driver.find_element_by_id('ctl00_content_lbTypeEng').text,
            driver.find_element_by_id('ctl00_content_Label11').text,
            driver.find_element_by_id('ctl00_content_Label17').text
        ))
    except:
        f.write(tailnumbers[aircraft]+'\n')
        print('Processing: '+tailnumbers[aircraft]+"    ERROR   "+str(aircraft)+' de '+str(qtd+1)+' - '+'{:.2f} %'.format(aircraft*100/qtd)+'     {:.2f} s'.format(time()-t0))

f.close()

companies = open('companies.csv','w')
companies.write("Name,City,State,Country\n")
for tuples in data['companies']:
    companies.write(tuples[0]+','+tuples[1]+','+tuples[2]+','+tuples[3]+'\n')
companies.close()


engine_types = open('engine_types.csv','w')
engine_types.write("Engine_Types\n")
for types in data['engine_types']:
    engine_types.write(types+'\n')
engine_types.close()


aircraft_types = open('aircraft_types.csv','w')
aircraft_types.write("Aircraft_Type\n")
for types in data['aircraft_types']:
    aircraft_types.write(types+'\n')
aircraft_types.close()


aircraft_models = open('aircraft_models.csv','w')
aircraft_models.write("Manufacturer,Aircraft_Model\n")
for tuples in data['aircraft_models']:
    aircraft_models.write(tuples[0]+','+tuples[1]+'\n')
aircraft_models.close()


manufacturers = open('manufacturers.csv','w')
manufacturers.write("Manufacturer\n")
for name in data['manufacturers']:
    manufacturers.write(name+'\n')
manufacturers.close()


aircrafts = open('aircrafts.csv','w')
aircrafts.write("N-Number,Company_name,Airplane_Model,Engine_Type,Aircraft_Type,Year\n")
for tuples in data['aircrafts']:
    aircrafts.write(tuples[0]+','+tuples[1]+','+tuples[2]+','+tuples[3]+','+tuples[4]+','+tuples[5]+'\n')
aircrafts.close()


driver.quit()