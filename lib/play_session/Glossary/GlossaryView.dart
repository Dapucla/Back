import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'ClimateChange.dart';

class Glossary {
  final String title;
  final String description;

  Glossary({required this.title, required this.description});
}

class GlossaryView extends StatelessWidget {
   GlossaryView({Key? key}) : super(key: key);

  final List<Glossary> glossaryList = [
    Glossary(
      title: "Carbon budget:",
      description:
      "The maximum amount of CO2 (and other greenhouse gases, expressed as CO2e) an entity can emit over a period of time as a result of its carbon emissions reduction goals. Carbon budgets can be set by individuals, organizations (incl. companies) and countries.",
    ),
    Glossary(
      title: "Carbon Dioxide (CO2):",
      description:
      """ A gas consisting of a carbon atom and two oxygen atoms. CO2 occurs naturally in the earth's atmosphere. Its concentration in the atmosphere has risen from 280 parts per million in pre-industrial times to 415 parts per million today. CO2 absorbs and radiates heat, and thereby helps to control the temperature on earth. However, if there is too much CO2 in the atmosphere, temperatures on earth increase.
        CO2 is emitted naturally through volcanoes and hot springs and by humans, principally through the burning of fossil fuels (coal, oil, gas). CO2 is absorbed by plants and trees. Therefore, deforestation also contributes to the increase in CO2 in the atmosphere. CO2 is the most important greenhouse gas in the atmosphere. Other gases such as methane and nitrous oxide are more powerful in terms of absorbing heat, but they are less plentiful and stay remain in the atmosphere for a shorter period of time than CO2.
       """,
    ),
    Glossary(
      title: "Climate Change:",
      description:
      "A long-term change in the average weather patterns that have come to define Earth’s local, regional and global climates. This change can be natural or human-induced.",
    ),
    Glossary(
      title: "CO2 equivalent (CO2e):",
      description:
      """ 
      A standardized measure of greenhouse gas emissions expressed as equivalents of CO2. Each greenhouse gas has its own Global Warming Potential (see below). Expressing emissions as CO2e involves multiplying the quantity of emissions of a greenhouse gas by its Global Warming Potential. This enables emissions of different types to be compared or added up.
      """,
    ),
    Glossary(
      title: "Embodied carbon:",
      description:
      "The amount of CO2 involved in the production and transport of a product prior to its use.",
    ),
    Glossary(
      title: "Emission factor:",
      description: "An expression of how much CO2e is emitted as a result of a certain activity. For example, the amount of CO2e emitted as a result of 1kWh of electricity use.",
    ),
    Glossary(
      title: "Environmental Product Declaration (EPD):",
      description: "A declaration by the manufacturer about the environmental impact of a product. An EPD usually includes a full lifecycle assessment (LCA), including the environmental impact of manufacturing of the product, its use and its disposal after its useful life. An EPD contains a statement on the product's embodied carbon.",
    ),
    Glossary(
      title: "Global warming:",
      description: "The rise in average global temperatures as a result of an increase in the concentration of greenhouse gas in the atmosphere.",
    ),
    Glossary(
        title: "Global Warming Potential (GWP):",
        description: "Each greenhouse gas has a different rate at which it absorbs heat in the atmosphere. Global warming potential is the heat absorbed by any greenhouse gas in the atmosphere, as a multiple of the heat that would be absorbed by the same mass of carbon dioxide.",
    ),
    Glossary(
      title: "Greenhouse gas (GHG):",
      description: "There are many greenhouse gases that trap heat in the earth's atmosphere. CO2 is the most common, but others, such as Methane (CH4) and Nitrous Oxide (N2O) are more powerful.",
    ),
    Glossary(
      title: "Greenhouse Gas Protocol (GHG Protocol):",
      description: "A global standard for measuring and reporting greenhouse gas emissions by organizations and governments. The GHG Protocol is the result of a collaboration between the World Resources Institute (WRI) and the World Business Council for Sustainable Development (WBCSD).",
    ),
    Glossary(
      title: "Net Zero:",
      description: "Net Zero refers to the situation when the quantity of greenhouse gases released into the atmosphere (expressed in CO2e) is the same as the quantity that is withdrawn from it.",
    ),
    Glossary(
      title: "Offset:",
      description: "An offset is a reduction in GHG emissions made as compensation for emissions elsewhere. Offsets can take the form of avoided emissions (e.g. by generating additional renewable energy) or carbon capture (e.g. by planting a forest). Offsets have been criticized, as they may seem to offer companies the opportunity to avoid reducing their own emissions.",
    ),
    Glossary(
      title: "Paris Agreement:",
      description: "Agreed in 2015, the Paris Agreement provides a framework for countries to reduce greenhouse gas emissions in order to keep global rise in average temperatures well below 2 degrees compared to pre-industrial levels. The Paris Agreement has been signed by over 190 countries, representing more than 95% of global greenhouse gas emissions.",
    ),
    Glossary(
      title: "RevPAR:",
      description: "Revenue Per Available Room, calculated by multiplying a hotel's occupancy rate by its average room rate. Alternatively, RevPAR can be measured by dividing total room revenue by the number of available hotel rooms during the period being measured.",
    ),
    Glossary(
      title: "Science Based Targets initiative:",
      description: "A Non-Governmental Organization that certifies emission reduction goals set by companies in line with climate science.",
    ),
    Glossary(
      title: "Scope 1, 2, 3:",
      description: "The GHG Protocol classifies emissions into Scope 1 (onsite emissions), Scope 2 (emissions from purchased energy) and Scope 3 (emissions in the wider value chain of an organization). Emissions that are part of Scopes 1 and 2 are easiest to track and influence by a company. However, emissions outside the immediate boundaries of an organization (e.g. embodied carbon of purchased products or emissions arising from the use of a company's product) can be even greater than Scope 1 and 2 emissions. In Net Zero, if the hotel outsources its laundry operations, Scope 2 emissions will fall and Scope 3 emissions (from purchased laundry services) will go up.",
    )
  ];

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.white,
         leading: IconButton(
           icon: Icon(Icons.arrow_back),
           onPressed: () => GoRouter.of(context).go('/play'), // Make sure this route is correctly set in your GoRouter configuration
         ),
         title: Text('Glossary',
           style: TextStyle(
           fontFamily: 'Poppins-Regular',
           fontSize: 32,
           fontWeight: FontWeight.bold,
           color: Color(0xFF0C2D57),
         ),
         ),
         elevation: 0,
       ),
       body: ListView.builder(
         itemCount: glossaryList.length,
         itemBuilder: (context, index) {
           return Card(
             margin: EdgeInsets.all(10),
             child: ListTile(
               contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
               title: Text(
                 glossaryList[index].title,
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Color(0xFF0C2D57),
                 ),
               ),
               subtitle: Text(
                 glossaryList[index].description,
                 style: TextStyle(
                   color: Colors.black54,
                 ),
               ),
               isThreeLine: true,
               trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
               onTap: () {
                 showDialog(
                   context: context,
                   builder: (context) => AlertDialog(
                     title: Text(glossaryList[index].title),
                     content: SingleChildScrollView(
                       child: Text(glossaryList[index].description),
                     ),
                     actions: [
                       TextButton(
                         onPressed: () => Navigator.pop(context),
                         child: Text('CLOSE', style: TextStyle(color: Colors.teal)),
                       ),
                     ],
                   ),
                 );
               },
             ),
           );
         },
       ),
     );
   }
}

