@routing @testbot @routes @duration
Feature: Durations

	Background:
		Given the profile "testbot"
		
    Scenario: Duration of ways
    	Given the node map
    	 | a | b |  |   |   |
    	 |   |   |  | e |   |
    	 |   | c |  |   | d |
	 
    	And the ways
    	 | nodes | highway | duration |
    	 | ab    | primary | 0:01     |
    	 | bc    | primary | 0:10     |
    	 | cd    | primary | 1:00     |
    	 | de    | primary | 10:00    |

 		When I route I should get
 		 | from | to | route | distance | time       |
 		 | a    | b  | ab    | 100m +-1 | 60s +-1    |
 		 | b    | c  | bc    | 200m +-1 | 600s +-1   |
 		 | c    | d  | cd    | 300m +-1 | 3600s +-1  |
 		 | d    | e  | de    | 144m +-2 | 36000s +-1 |

    Scenario: Partial duration of ways
    	Given the node map
    	 | a | b |  | c |

    	And the ways
    	 | nodes | highway | duration |
    	 | abc   | primary | 0:01     |

 		When I route I should get
 		 | from | to | route | distance | time    |
 		 | a    | c  | abc   | 300m +-1 | 60s +-1 |
 		 | a    | b  | ab    | 100m +-1 | 20s +-1 |
 		 | b    | c  | bc    | 200m +-1 | 40s +-1 |
