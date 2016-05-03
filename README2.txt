Team Website Feature list:
I. [X] Create accounts of various kind; login, logout.


II. Auctions
    [X] a seller posts items for sale
    [X] set all the characteristics of the item
    [X] set closing date and time
    [X] set a hidden minimum price (reserve)
    [X] a buyer should be able to bid
        [X] manually
            [X] alert the buyer that a higher bid has been placed
              [X] let the buyer set a new bid
        [X] with automatic bidding
            [X] set a secret upper limit
            [X] put in a higher bid automatically for the user in case someone bids higher
            [X] alert the buyer in case someone bids more than your upper limit
   [] when the closing date and time has come
        [] check if the seller has set a reserve
             [] if yes: if the reserve is higher than the last bid none is the winner.
                         if the maximum bid meets the reserve, it will automatically increase to meet that price.
             [] if no: whoever has the higher bid is the winner

III Browsing and advanced search functionality
    [X] let people browse on the items and see the status of the current bidding
    [] sort by different criteria (by type, bidding price etc.)
    [X] search the list of items by various criteria.
    [] let user set an alert for specific items (s)he is interested in



IV. Customer representatives and admin functions
    [X] create an admin account ahead of time
    [X] messaging system to communicate between CSR, Admin and Members
    the admin.
    [X] Hacker detection! (SQL Trigger). Sends warning message to admin if a 'hacker' registers.
    [X] creates accounts for customer representatives
        [X] generates sales reports for:
            [X] total earnings
            [X] earnings per:
                [X] item
                [] item type
		[X] item avg price sold
                [X] end-user
            [X] best-selling items
               [X] best buyers
    [X] user question answering
        [X]create a page for users to ask questions
        [X] a user can post a question
        [X] a user can search and browse questions and answers
        [X] a customer representative:
            [X] answers to questions of users
    [X] modifies any information (if reset user password)
    [X] removes bids
    [X] remove illegal auctions
    
V History of auctions and auction similarity
    [X] a user should be able to:
        [X] view the history of bids for any specific auction
        [X] view the list of all auctions a specific buyer or seller has participated in
        [X] view the list of "similar" items on auctions in the preceding month (and auction information about them)

 
