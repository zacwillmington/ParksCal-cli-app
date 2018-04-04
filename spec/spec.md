# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application -
 I've created the CLI with indexing for easy use. Initially I greet the user with procedural puts statements with a sleep method inbetween to keep the flow a natural flow while reading the output.    

- [x] Pull data from an external source -
The data I scraped is from nps.gov. I iterated through the parks list retrieving each park name (h3) elements and url for more information. Once I had the name and url for each park I simply had to scrape the info page for what I needed.     

- [x] Implement both list and detail views -
I decided to drill down 2 levels in my gem. The program starts off by listing all parks for the user to choose from. Upon choosing a location I provided another list view for specific information e.g. address, location and directions.  
