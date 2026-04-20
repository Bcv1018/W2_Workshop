\#Requirements and Conceptual Model

Luis Espinosa Villicana, Edmund Viray, Kevin Tran, Brandon Carrillo-Valencia

Cateogies:

1. Customer Info

* Customer ID (PK)
-Name
-Address
-Payment
-Phone Number
2. Services/Charges

* Session ID (PK)
-Customer ID (FK)
-Session Rate
-Cost
-Session qty
3. Pet Info

* Pet ID (PK)
* Customer ID (FK)
-Pet Name
-Pet Breed
-Pet Color


Ex2.4
a) What are the similarities between individual diagrams? What turned out the same?

    For the most part our individual diagrams were basically the same with one or two tweaks.

b) Where did each of your diagrams differ? What explanation do you have for those
differences? What might be the pros and cons of each approach?

    Brandon and Edmund removed cost from their diagrams, and for everyone else's it kept the cost column, and also had him add petID foreign key to the services. For Kevin and Luis they stayed the same.

    Removing the cost tab was trying to be as efficient as possible and save space.
    Adding the PetID FK was just making more relationship between tables and future proofing any problems that may occur in the future in terms of making sure the pet and customer are correct in the service table.


Ex3.8
a) Have everyone take a turn to share their screen and walk through the script they
created. Are there differences across your group in how you each implemented
tables? What drove the different choices that were made?

    There are differences in how our tables constructed, Luis was more detailed in the comments for every statement while the rest of our tables did not. For Brandon's table the ai did not have it do on delete cascade while the rest did.
    The general implemtation of the tables was all in the same order.



Ex4A.6
a) Reconvene with your small group and take turns reviewing each of your insert scripts
in the W2_Workshop repository.

    Our experience with using AI chat was relatively easy and straighforward. It was a useful troubleshooting tool as if there was any complications or issues it will explain them and help us understand what was going on and how to fix it. Some of the mistakes was that it would ignore a column or not create enough sample data.

b) How does your sample data look? What things can you start to determine about this
business, based on the sample records you’ve created?

    The sample data given seems to fit the description of all the columns perfectly. You can tell where the business is likely
    located with the addresses displayed, such as San Mateo for Edmund's sample data. The business seems to charge more
    for the first hour of a session, and the cost to time ratio is cheaper the longer a session is. They also accept a wide
    variety of breeds such as huskys and bulldogs.

c.)Everyone in your small group started from the same brainstorming document. After
working independently on implementation, how different have your databases
turned out? What are the most notable differences?

    Our databases turned out pretty similar to each other, as there wasn't too much variation with how
    our AI's generated our models. Even the generated samples are quite similar, with costs, location being in the Bay Area.
    The most notable differences are columns that are new or missing from tables, such as 'SessionDate', or using 'SessionQty'
    instead of 'Duration' to determine costs.